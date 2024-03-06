<img src="./assets/parrotOS.jpg" alt="">

# Setup 4 ParrotOS Linux

### upgrade system
```bash
sudo parrot-upgrade -y
```


### start setup
```bash
bash setup.sh
```

### remove garbage
```bash
sudo apt autoremove -y
```

### reboot system
```bash
reboot
```

#

### also, create new gpg & ssh keys
```bash
bash gpg.sh
bash ssh.sh
```