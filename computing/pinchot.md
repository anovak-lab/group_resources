# Pinchot

Pinchot is a server owned by Prof. Novak which students are free to use for running simulations, building code, etc. To access, use
your NetID (replace for `ajnovak2`):

```
ssh ajnovak2@pinchot.npre.illinois.edu
```

If you are not on campus internet, you will need to be on the UIUC VPN. Instructions are
[here](https://answers.uillinois.edu/illinois/page.php?id=47629). If you already have a VPN
client, simply enter `vpn.illinois.edu` and "Connect."

## Python API

You will need to install the OpenMC Python API in your user space, even if you are using
the shared OpenMC in `/shared/data/openmc`.

```
cd /shared/data/openmc
pip install .
```

If you need any assistance with this machine, send an email to: engrit-help@illinois.edu.
