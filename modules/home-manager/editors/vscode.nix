{ config, pkgs, globals, ... }:

let
  flakeDir = config.home.homeDirectory + "/nixos-dotfiles";
  flakeInputs = (builtins.getFlake flakeDir).inputs;
  flakeSelf = "git+file://${flakeDir}";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;

    profiles = {
      default = {

        userSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nix.formatting.command" = "nixfmt"; # Dùng formatting.command
        "nix.serverSettings" = {
          "nixd" = {
            "nixpkgs" = {
              "expr" = "(builtins.getFlake \"${flakeSelf}\").nixosConfigurations.${globals.hostname}.pkgs";
            };
            "options" = {
              "nixos" = {
                "expr" = "(builtins.getFlake \"${flakeSelf}\").nixosConfigurations.${globals.hostname}.options";
              };
              "home-manager" = {
                "expr" = "(builtins.getFlake \"${flakeSelf}\").homeConfiguration.\"${globals.username}\".options";
              };
            };
          };
        };

        #NOTE: LiveServer
        "liveServer.settings.donotShowInfoMsg" = true;
        "liveServer.settings.donotVerifyTags" = true;

        #NOTE: Emmet
        "emmet.preferences" = {
          "emmet.includeLanguages" = {
            "javascript" = "javascriptreact";
          };
          "emmet.triggerExpansionOnTab" = true;
        };

        #NOTE: Editor
        "editor.guides.bracketPairs" = true;
        "editor.linkedEditing" = true;
        "editor.stickyScroll.enabled" = false;
        "editor.tabSize" = 2;
        "editor.wordWrapColumn" = 100;
        "editor.wordWrap" = "on";
        "editor.cursorBlinking" = "expand";
        "editor.fontLigatures" = true;
        "editor.bracketPairColorization.enabled" = true;
        "editor.smoothScrolling" = true;
        "editor.mouseWheelZoom" = true;
        "editor.detectIndentation" = false;
        "editor.renderWhitespace" = "all";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.minimap.enabled" = false;
        "editor.hover.delay" = 1000;
        "editor.fontFamily" = "'JetBrainsMono Nerd Font','Fira Code',Consolas, 'Courier New', monospace";
        "editor.lineNumbers" = "relative";
        "editor.occurrencesHighlight" = "off";
        "editor.hideCursorInOverviewRuler" = true;
        "editor.tokenColorCustomizations" = {
          "[*Light*]" = {
            "textMateRules" = [
              {
                "scope" = "ref.matchtext";
                "settings" = {
                  "foreground" = "#000";
                };
              }
            ];
          };
          "[*Dark*]" = {
            "textMateRules" = [
              {
                "scope" = "ref.matchtext";
                "settings" = {
                  "foreground" = "#fff";
                };
              }
            ];
          };
          "textMateRules" = [ ];
        };
        "workbench.startupEditor" = "none";
        "workbench.settings.applyToAllProfiles" = [
          "editor.tabSize"
          "editor.detectIndentation"
          "editor.insertSpaces"
        ];
        "workbench.tips.enabled" = false;
        "workbench.tree.enableStickyScroll" = false;
        "workbench.tree.renderIndentGuides" = "none";

        #NOTE: React Snippets
        "reactSnippets.settings.importReactOnTop" = false;

        #NOTE: Material icon theme
        "material-icon-theme.hidesExplorerArrows" = true;

        #NOTE: Files
        "files.exclude" = {
          "**/.git" = false;
        };
        "files.associations" = {
          "*.embeddedhtml" = "html";
          "flake.lock" = "json";
          "*.css" = "tailwindcss";
          ".env*" = "dotenv";
          "array" = "cpp";
          "atomic" = "cpp";
          "bit" = "cpp";
          "cctype" = "cpp";
          "cfenv" = "cpp";
          "charconv" = "cpp";
          "clocale" = "cpp";
          "cmath" = "cpp";
          "codecvt" = "cpp";
          "compare" = "cpp";
          "concepts" = "cpp";
          "condition_variable" = "cpp";
          "cstdarg" = "cpp";
          "cstddef" = "cpp";
          "cstdint" = "cpp";
          "cstdio" = "cpp";
          "cstdlib" = "cpp";
          "cstring" = "cpp";
          "ctime" = "cpp";
          "cwchar" = "cpp";
          "cwctype" = "cpp";
          "deque" = "cpp";
          "map" = "cpp";
          "string" = "cpp";
          "unordered_map" = "cpp";
          "vector" = "cpp";
          "exception" = "cpp";
          "algorithm" = "cpp";
          "functional" = "cpp";
          "iterator" = "cpp";
          "memory" = "cpp";
          "memory_resource" = "cpp";
          "numeric" = "cpp";
          "optional" = "cpp";
          "random" = "cpp";
          "ratio" = "cpp";
          "string_view" = "cpp";
          "system_error" = "cpp";
          "tuple" = "cpp";
          "type_traits" = "cpp";
          "utility" = "cpp";
          "format" = "cpp";
          "fstream" = "cpp";
          "initializer_list" = "cpp";
          "iomanip" = "cpp";
          "iosfwd" = "cpp";
          "iostream" = "cpp";
          "istream" = "cpp";
          "limits" = "cpp";
          "mutex" = "cpp";
          "new" = "cpp";
          "numbers" = "cpp";
          "ostream" = "cpp";
          "queue" = "cpp";
          "ranges" = "cpp";
          "semaphore" = "cpp";
          "span" = "cpp";
          "sstream" = "cpp";
          "stdexcept" = "cpp";
          "stop_token" = "cpp";
          "streambuf" = "cpp";
          "text_encoding" = "cpp";
          "thread" = "cpp";
          "typeinfo" = "cpp";
          "variant" = "cpp";
        };
        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;

        #NOTE: Explorer
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.compactFolders" = false;

        #NOTE: Git
        "git.openRepositoryInParentFolders" = "always";
        "git.autofetch" = true;
        "git.enableSmartCommit" = true;
        "git.confirmSync" = false;

        #NOTE: Path Intellisense
        "path-intellisense.autoSlashAfterDirectory" = true;
        "path-intellisense.autoTriggerNextSuggestion" = true;
        "path-intellisense.ignoreTsConfigBaseUrl" = true;
        "path-intellisense.showHiddenFiles" = true;

        #NOTE: Window
        # (Không có gì ở đây)

        #NOTE: Terminal
        "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
        "terminal.integrated.defaultProfile.windows" = "PowerShell";
        "terminal.integrated.enableMultiLinePasteWarning" = "never";
        "terminal.integrated.suggest.enabled" = true;

        #NOTE: HTML
        "html.format.wrapLineLength" = 0;
        "html.format.contentUnformatted" = "pre,code,textarea";
        "html.format.maxPreserveNewLines" = 1;
        "html.format.preserveNewLines" = true;
        "html.format.wrapAttributes" = "force-expand-multiline";

        #NOTE: Pretitier / Format
        "[html]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[css]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[markdown]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[javascriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[scss]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[jsonc]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

        #NOTE: CSpell
        "cSpell.userWords" = [ ];
        "cSpell.ignoreWords" = [ ];
        "cSpell.language" = "en,vi";
        "cSpell.enabledFileTypes" = {
          "markdown" = false;
        };

        #NOTE: Better Comments
        "better-comments.tags" = [
          {
            "tag" = "TODO:";
            "color" = "#EA580C";
            "strikethrough" = false;
            "backgroundColor" = "transparent";
          }
          {
            "tag" = "FIXME:";
            "color" = "#FF2D00";
            "strikethrough" = false;
            "backgroundColor" = "transparent";
          }
          {
            "tag" = "BUG:";
            "color" = "#9333EA";
            "strikethrough" = false;
            "backgroundColor" = "transparent";
          }
          {
            "tag" = "HACK:";
            "color" = "#C026D3";
            "strikethrough" = false;
            "backgroundColor" = "transparent";
          }
          {
            "tag" = "NOTE:";
            "color" = "#2563EB";
            "strikethrough" = false;
            "backgroundColor" = "transparent";
          }
          {
            "tag" = "INFO:";
            "color" = "#0EA5E9";
            "strikethrough" = false;
            "backgroundColor" = "transparent";
          }
          {
            "tag" = "IDEA:";
            "color" = "#FFF";
            "strikethrough" = false;
            "backgroundColor" = "#EAB308";
          }
        ];

        #NOTE: Security
        "security.workspace.trust.untrustedFiles" = "open";

        #NOTE: C/C++
        "C_Cpp.default.compilerPath" = "C:\\msys64\\ucrt64\\bin\\gcc.exe";
        "C_Cpp.autocompleteAddParentheses" = true;
        "C_Cpp.formatting" = "clangFormat";
        "C_Cpp.default.includePath" = [
          "C:/Program Files/emsdk/upstream/emscripten/system/include"
        ];

        #NOTE: GitHub Copilot
        "github.copilot.enable" = {
          "*" = false;
          "plaintext" = false;
          "markdown" = false;
          "scminput" = false;
        };

        #NOTE: Background
        # "background.fullscreen" = {
        #   "images" = [
        #     "https://4kwallpapers.com/images/walls/thumbs_3t/6604.jpg"
        #     "https://4kwallpapers.com/images/walls/thumbs_3t/22219.jpg"
        #     "https://4kwallpapers.com/images/walls/thumbs_3t/22630.jpg"
        #     "https://4kwallpapers.com/images/walls/thumbs_3t/23046.jpg"
        #   ];
        #   "opacity" = 0;
        #   "size" = "cover";
        #   "position" = "center";
        #   "interval" = 0;
        #   "random" = true;
        # };

        #NOTE: CodeSnap
        "codesnap.target" = "window";

        #NOTE: Tailwindcss
        "tailwindCSS.emmetCompletions" = true;
        "tailwindCSS.includeLanguages" = {
          "html" = "html";
          "javascript" = "javascript";
          "css" = "css";
        };
        "tailwindCSS.experimental.configFile" = null;

        #NOTE: Markdown
        "markdownlint.config" = {
          "default" = true;
        };

        #NOTE: Json
        "json.schemaDownload.enable" = true;

        #NOTE: Typescript
        "typescript.updateImportsOnFileMove.enabled" = "always";

        #NOTE: MCP
        "chat.mcp.serverSampling" = { };
        "chat.mcp.discovery.enabled" = {
          "claude-desktop" = true;
          "windsurf" = true;
          "cursor-global" = true;
          "cursor-workspace" = true;
        };

        #NOTE: DotENV
        "dotenv.enableAutocloaking" = false;
        "github.copilot.nextEditSuggestions.enabled" = true;

        #NOTE: PHP
        "php.format.codeStyle" = "Laravel";
        "php.inlayHints.insertOnDoubleClick" = false;
        "php.format.rules.booleanConstantCasing" = "lowercase";
        "php.format.rules.spaceAfterUnaryNot" = false;
        "php.inlayHints.parameters.enabled" = false;
        "php.format.rules.openBraceOnNewLineForBlocks" = false;
        "php.format.rules.openBraceOnNewLineForFunctions" = false;
        "php.format.rules.openBraceOnNewLineForLambdas" = false;
        "php.format.rules.alignConstants" = false;
        "php.format.rules.alignEnumCases" = false;
        "php.format.rules.openBraceOnNewLineForTypes" = false;
        "php.format.rules.keepFunctionsOnOneLine" = true;
        "php.format.rules.spaceBeforeColonInControlStatements" = false;

        #NOTE: SQLTools
        "sqltools.connections" = [ ];
        "sqltools.useNodeRuntime" = true;

        #NOTE: SQL Formatter
        "sql-formatter.uppercase" = true;

        #NOTE: Prettier SQL
        "Prettier-SQL.keywordCase" = "upper";

        "telemetry.telemetryLevel" = "off";

        "php.inlayHints.types.return" = false;
        "diffEditor.ignoreTrimWhitespace" = true;
        "php.format.rules.importSorting" = "alphabetic";
        "php.format.rules.callParametersNewLineAfterLeftParen" = true;
        "php.format.rules.callParametersNewLineBeforeRightParen" = true;
        "php.format.rules.callParametersWrap" = "onEveryItem";
        "php.format.rules.arrayInitializersNewLineBeforeFirstElement" = true;
        "php.format.rules.arrayInitializersNewLineAfterLastElement" = true;
        "php.format.rules.arrayInitializersWrap" = "onEveryItem";
        "mssql.connectionGroups" = [
          {
            "name" = "ROOT";
            "id" = "7CE6DBAA-33D5-4275-B4D3-09971EC78397";
          }
        ];
        "mssql.connections" = [
          {
            "authenticationType" = "Integrated";
            "connectTimeout" = 30;
            "applicationName" = "vscode-mssql";
            "applicationIntent" = "ReadWrite";
            "server" = "(localdb)\\MSSQLLocalDB";
            "database" = "";
            "groupId" = "7CE6DBAA-33D5-4275-B4D3-09971EC78397";
            "id" = "490E7133-CE70-4DC4-A5E3-785D8D2EAB07";
            "user" = "";
            "password" = "";
            "commandTimeout" = 30;
            "encrypt" = "Mandatory";
            "profileSource" = 0;
          }
        ];
        "[sql]" = {
          "editor.defaultFormatter" = "ms-mssql.mssql";
        };
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.colorTheme" = "Dracula Theme";
      };
      };
    };
  };
}
