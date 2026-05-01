# Datagrip

Datagrip is Jetbrains product for working with data which I required to use sometimes. This page describes the tricks and configuration I prefer.

 User-wide configuration files are typically located in the `~/.config/JetBrains/DataGrip<version>/` folder. The paths mentioned on this page are, by default, relative to this folder.

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

## Fonts

Fonts configurations are located in the `options` directory:

The configuration for code editor `editor-font.xml`:

```xml
<application>
  <component name="DefaultFont">
    <option name="VERSION" value="1" />
    <option name="FONT_SIZE" value="10" />
    <option name="FONT_SIZE_2D" value="10.0" />
    <option name="FONT_FAMILY" value="Inconsolata" />
    <option name="FONT_REGULAR_SUB_FAMILY" value="Medium" />
    <option name="FONT_BOLD_SUB_FAMILY" value="Medium" />
  </component>
</application>
```

The configuration for the terminal `terminal-font.xml`:

```xml
<application>
  <component name="TerminalFontOptions">
    <option name="VERSION" value="1" />
    <option name="FONT_SIZE" value="10" />
    <option name="FONT_SIZE_2D" value="10.0" />
    <option name="FONT_FAMILY" value="Inconsolata" />
    <option name="FONT_REGULAR_SUB_FAMILY" value="Medium" />
    <option name="FONT_BOLD_SUB_FAMILY" value="Medium" />
  </component>
</application>
```
