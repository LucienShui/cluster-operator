# cluster-operator

对集群统一进行操作

# Reference

```bash
cut
expect
```

# Usage

```bash
ln -s $PWD/c* /usr/local/bin/
```

## ccp

拷贝本地文件至远端

```bash
ccp <remote_list> <local_path> <remote_path>
```

## csh

在远端执行命令，如果命令中包含空格请用引号包裹

```bash
csh <remote_list> "<command>"
```

