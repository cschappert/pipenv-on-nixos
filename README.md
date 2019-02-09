# pipenv on nixos

* An attempt at gracefully integrating pipenv with nix-shells.
  * The goal is to use nix-shells to manage Python version and external dependencies while continuing to use pipenv to manage project specific package dependencies. This way nixos users and users of other distributions / operating systems are able to collaborate relatively painlessly.
* In `NixOS 18.09`, the version of `pip` offered in `python36Packages.pip` is `pip 18.1` and the current version of `pipenv` offered is `pipenv-2018.7.1`.
  * Unfortunately, these versions are not compatible (https://github.com/pypa/pipenv/issues/2924). The solution is to upgrade either tool to a more recent version. I've opted to use the pip offered by Nix to perform a user install of pipenv.

## Usage

### On NixOS

```bash
$ git clone https://github.com/cschappert/pipenv-on-nixos.git
$ cd pipenv-on-nixos
$ nix-shell
# Use pipenv as normal here. Packages will be installed into virtualenvs
# under $HOME/.local/
[nix-shell] $ pipenv install
```

* It may be necessary to add packages to default.nix in order to satisfy the external dependencies of Python packages used in your project.

### On other distributions / operating systems

* Manange Python installations with `pyenv`, Docker containers or any other tool of your choice.
* Use `pipenv` as normal.
