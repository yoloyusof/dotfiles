{ extensions, pkgs }:
builtins.concatLists (builtins.attrValues {
  markdown = with extensions; [
    bierner.markdown-emoji
    bpruitt-goddard.mermaid-markdown-syntax-highlighting
    davidanson.vscode-markdownlint
    mushan.vscode-paste-image
    unifiedjs.vscode-mdx
    yzhang.markdown-all-in-one
  ];
  fullstack = with extensions; [
    astro-build.astro-vscode
    bierner.comment-tagged-templates
    codespaces-contrib.codeswing
    dtsvet.vscode-wasm
    ecmel.vscode-html-css
    fivethree.vscode-svelte-snippets
    ms-playwright.playwright
    ms-vscode.live-server
    oven.bun-vscode
    svelte.svelte-vscode
    antfu.unocss
    bradlc.vscode-tailwindcss
  ];
  gnome = with extensions; [
    bodil.blueprint-gtk
    nico-castell.linux-desktop-file
  ];
  roblox = with extensions; [
    evaera.vscode-rojo
    koihik.vscode-lua-format
    nightrains.robloxlsp
    roblox-ts.vscode-roblox-ts
  ];
  themes = with extensions; [
    github.github-vscode-theme
    johnpapa.vscode-peacock
    piousdeer.adwaita-theme
    pkief.material-icon-theme
    vscode-icons-team.vscode-icons
  ];
  rust = with extensions; [
    relm4.relm4-snippets
    rust-lang.rust-analyzer
    tamasfe.even-better-toml
  ];
  other = with extensions; [
    bierner.emojisense
    editorconfig.editorconfig
    esbenp.prettier-vscode
    github.remotehub
    pkgs.vscode-extensions.github.vscode-pull-request-github
    icrawl.discord-vscode
    jnoortheen.nix-ide
    mikestead.dotenv
    pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
    ms-vsliveshare.vsliveshare
    redhat.vscode-xml
    redhat.vscode-yaml
    spgoding.datapack-language-server
    thenuprojectcontributors.vscode-nushell-lang
    ultram4rine.vscode-choosealicense
    # pkgs.vscode-extensions.usernamehw.errorlens
    visualstudioexptteam.vscodeintellicode
    vivaxy.vscode-conventional-commits
    ziglang.vscode-zig
    formulahendry.auto-rename-tag
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons
  ];
})
