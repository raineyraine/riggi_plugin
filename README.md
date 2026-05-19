<p align="center">
  <h1 align="center"><b>Charm</b></h1>
  <p align="center">
    Roblox plugin for inserting characters. Currently only works with Perdere character saves.
    <br />
  </p>
</p>

<div align="center">
   <a href="https://github.com/raineyraine/roblox-plugin-riggi/issues"><img src="https://img.shields.io/github/actions/workflow/status/raineyraine/roblox-plugin-riggi/ci.yaml?colorA=363a4f&colorB=a6da95&style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNTYgMjU2Ij4KPHBhdGggZD0iTTIxNiwzMlYxOTJhOCw4LDAsMCwxLTgsOEg3MmExNiwxNiwwLDAsMC0xNiwxNkgxOTJhOCw4LDAsMCwxLDAsMTZINDhhOCw4LDAsMCwxLTgtOFY1NkEzMiwzMiwwLDAsMSw3MiwyNEgyMDhBOCw4LDAsMCwxLDIxNiwzMloiIHN0eWxlPSJmaWxsOiAjQ0FEM0Y1OyIvPgo8L3N2Zz4="></a>
  <a href="https://github.com/raineyraine/roblox-plugin-riggi/releases/latest"><img src="https://img.shields.io/github/v/release/raineyraine/roblox-plugin-riggi?colorA=363a4f&colorB=a6da95&style=for-the-badge&logo=github&logoColor=cad3f5"></a>
  <a href="https://github.com/raineyraine/roblox-plugin-riggi/issues"><img src="https://img.shields.io/github/issues/raineyraine/roblox-plugin-riggi?colorA=363a4f&colorB=f5a97f&style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNTYgMjU2Ij4KPHBhdGggZD0iTTIxNiwzMlYxOTJhOCw4LDAsMCwxLTgsOEg3MmExNiwxNiwwLDAsMC0xNiwxNkgxOTJhOCw4LDAsMCwxLDAsMTZINDhhOCw4LDAsMCwxLTgtOFY1NkEzMiwzMiwwLDAsMSw3MiwyNEgyMDhBOCw4LDAsMCwxLDIxNiwzMloiIHN0eWxlPSJmaWxsOiAjQ0FEM0Y1OyIvPgo8L3N2Zz4="></a>
</div>

## 📦 Installation

### Github Releases
You can install the latest `.rbxm` of the plugin [here](https://github.com/raineyraine/riggi_plugin/releases/latest). Then, you will have to add it as a local plugin in studio. Use `Plugins > Plugins Folder` to find that folder:

![alt text](assets/studio-plugin-folder.png)

You will likely have to reload studio to have it properly install.

### Build Manually

You can also clone the repository and run the `lune build -i` script to build and install the plugin.

## Usage

The main interface looks like this:

![Plugin ui example, Import rigs, Import rigs here, Import rigs (Plastic), Import rigs (Smoothplastic), Clear rig folder](assets/plugin-example.png)


* **Import rigs**\
  Prompts the user to upload `*.json` or `*.txt` files. The loaded rigs are placed in a folder in Workspace. It's recommended to not touch rigs in this folder, and to instead copy and paste rigs from the folder when needed.
* **Import rigs here**\
  Same as **Import Rigs**, but at the camera.
* **Import rigs (Plastic)**\
  Same as **Import Rigs**, but all accessory materials are Plastic.
* **Import rigs (SmoothPlastic)**\
  Same as **Import Rigs**, but all accessory materials are SmoothPlastic.
* **Clear rig folder**\
  Clears the children of the Workspace folder.

## 🗒️ License
[raineyraine/roblox-plugin-riggi] is licensed under the [MIT License](https://github.com/raineyraine/roblox-plugin-riggi/blob/main/LICENSE).

## 👥 Attribution
* [alicesaidhi/videkit_ty](https://github.com/alicesaidhi/videkit_ty/) MIT License\
  Used for plugin UI. Code is modified, since videkit_ty is not updated and doesn't work well with modern Vide and Luau.
* [centau/vide](https://github.com/centau/vide) MIT License\
  Used for plugin UI, core functionality, and state.