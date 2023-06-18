---
title: 'Permission Denied when adding Autocomplete for kubectl'
date: 2021-11-25T14:40:00+13:00
draft: false
featured: false
tags: [kubernetes, kubectl]
---

Intro
-----

Running

``` bash
sudo microk8s kubectl completion bash >/etc/bash_completion.d/kubectl
```

Results in

```
-bash: /etc/bash_completion.d/kubectl: Permission denied
```

Fix
-----

use ~/.bashrc instead
This means that Autocomplete will be kept up to date.

```
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'complete -F __start_kubectl mk8' >>~/.bashrc
```

