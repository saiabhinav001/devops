# Docker commands

Install and start Docker Desktop on Windows using Linux containers. Run these in PowerShell:

```powershell
docker --version
docker info
docker context ls
```

If `desktop-linux` is listed, select it:

```powershell
docker context use desktop-linux
```

```powershell
docker ps
docker ps -a
docker pull nginx
docker images
docker rmi nginx
docker pull nginx
docker run hello-world
docker run -it alpine sh
```

Now inside the Alpine shell:

```sh
cat /etc/os-release
uname -a
pwd
ls -l
exit
```

Back in PowerShell:

```powershell
Get-History
```

Lifecycle commands (replace `CONTAINER_ID` with a real ID; stop before removal):

```powershell
docker stop CONTAINER_ID
docker start CONTAINER_ID
docker stop CONTAINER_ID
docker rm CONTAINER_ID
```
