# Datagrip

Datagrip is Jetbrains product for working with data which I required to use sometimes. This page describes the tricks and configuration I prefer.

## Keymaps configuration

The default keymap source for Linux is: `~/.config/Jetbrains/DataGrip<version>/keymaps`. DataGrip reads files in the directory as keymap files. You have to choose the right one from GUI :).

Check more in [Configuration Direcotry](https://www.jetbrains.com/help/datagrip/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#config-directory).

My keymap file:

```xml
<keymap version="1" name="Fedor Kobak" parent="VSCode">
  <action id="ActivateProjectToolWindow">
    <keyboard-shortcut first-keystroke="ctrl b" />
  </action>
  <action id="Console.Jdbc.Execute">
    <keyboard-shortcut first-keystroke="ctrl enter" />
  </action>
  <action id="EditorStartNewLine" />
  <action id="GotoSymbol" />
  <action id="SplitChooser.Duplicate" />
  <action id="Terminal.SmartCommandExecution.Run" />
</keymap>
```

I wasn't able to find a specification for this file :).

It originates from the VSCode, so the default key bindings are somekind of VSCode versions.
