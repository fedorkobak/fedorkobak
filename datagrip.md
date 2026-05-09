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

## Editor

The `editor.xml` is responsible for the prorties of the editor.

```xml
<application>
  <component name="CodeInsightSettings">
    <option name="REFORMAT_ON_PASTE" value="1" />
  </component>
  <component name="EditorSettings">
    <option name="LINE_NUMERATION" value="HYBRID" />
  </component>
</application>
```

## Code style

The code style configuration determines the editors behaviour when the formatting code. The `codestyles/Default.xml` file:

```xml
<code_scheme name="Default" version="173">
  <SqlCodeStyleSettings version="7">
    <option name="QUERY_SECTION_1ST_WORD_ALIGN" value="0" />
    <option name="QUERY_EL_LINE" value="101" />
    <option name="QUERY_TRUE_INDENT" value="false" />
    <option name="QUERY_ALIGN_ELEMENTS" value="false" />
    <option name="ROUTINE_ARG_OPENING" value="0" />
    <option name="ROUTINE_ARG_WRAP" value="0" />
  </SqlCodeStyleSettings>
</code_scheme>
```
