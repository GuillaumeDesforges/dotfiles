(() => {
  const TAG = "[Launchpad Linux Fix]";

  // ALSA's 32-byte rawmidi port name buffer cuts the iJack string short.
  // Components matches on the trailing "DAW" / "MIDI" keywords that Mac/Windows
  // hand it. Rewrite the truncated tails back to what other OSes expose.
  const renameRules = [
    [/(LPMiniMK3) DA$/, "$1 DAW"],
    [/(LPMiniMK3) MI$/, "$1 MIDI"],
    [/(LPX) DA$/,       "$1 DAW"],
    [/(LPX) MI$/,       "$1 MIDI"],
    [/(LPProMK3) DA$/,  "$1 DAW"],
    [/(LPProMK3) MI$/,  "$1 MIDI"],
  ];

  const rename = (name) => {
    if (typeof name !== "string") return name;
    for (const [re, repl] of renameRules) {
      if (re.test(name)) return name.replace(re, repl);
    }
    return name;
  };

  const patchPort = (port) => {
    try {
      const original = port.name;
      const renamed = rename(original);
      if (renamed === original) return;
      Object.defineProperty(port, "name", {
        value: renamed,
        configurable: true,
        enumerable: true,
      });
      console.log(`${TAG} ${original}  ->  ${renamed}`);
    } catch (err) {
      console.warn(`${TAG} could not rename ${port?.name}:`, err);
    }
  };

  const orig = navigator.requestMIDIAccess?.bind(navigator);
  if (!orig) {
    console.warn(`${TAG} navigator.requestMIDIAccess unavailable; not patching`);
    return;
  }

  navigator.requestMIDIAccess = function patched(opts) {
    return orig(opts).then((access) => {
      for (const p of access.inputs.values())  patchPort(p);
      for (const p of access.outputs.values()) patchPort(p);
      access.addEventListener("statechange", (ev) => patchPort(ev.port));
      console.log(`${TAG} WebMIDI access patched`);
      return access;
    });
  };

  console.log(`${TAG} installed`);
})();
