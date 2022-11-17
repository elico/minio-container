/interface/bridge/add name=dockers
/ip/address/add address=172.17.0.254/24 interface=dockers

/interface/veth/add name=veth90 address=172.17.0.90/24 gateway=172.17.0.254
/interface/bridge/port add bridge=dockers interface=veth90

/container/config/set registry-url=https://registry-1.docker.io tmpdir=disk1/pull

/container/envs/add name=minio_envs key=TZ value="Asia/Jerusalem"
/container/envs/add name=minio_envs key=MINIO_ROOT_USER value="61accd06-4910-4af3-83ee-9f6505042c68"
/container/envs/add name=minio_envs key=MINIO_ROOT_PASSWORD value="fa2314a5-9819-412e-bbf3-14e5d4e5dcc4"
/container mounts add dst=/data name=minio_data src=/disk1/minio_data

/container/add mounts=minio_data dns=172.17.0.254 remote-image=elicro/minio:latest interface=veth90 root-dir=disk1/minio envlist=minio_envs start-on-boot=yes
