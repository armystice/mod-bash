Contains various useful bash scripts, as well as being the entrypoint for the armystice script infrastructure.

# Quickstart
```bash
# Run once on the host to initialise the $HOME/.armystice environment and install mod-bash:
# (executing this again will just update mod-bash)
bash -c "$(curl -XGET https://raw.githubusercontent.com/armystice/mod-bash/refs/heads/main/init_remote)"
#
# Example of updating mods (even this one!):
bash ~/.armystice/mod/mod-bash/mod update mod-bash
bash ~/.armystice/mod/mod-bash/mod update mod-conf
```