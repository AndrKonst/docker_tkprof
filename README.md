Build the image:
```bash
docker build \
    -t tkprof .
```

Grant execute permissions to the startup script:
```bash
chmod +x tkprof.sh 
```

Alias to invoke with the original utility syntax:
```bash
alias tkprof='bash <PATH_TO_PROJ_FOLDER>/tkprof.sh'
```

---
This project uses the official Oracle Linux 8 image (oraclelinux:8).
Please review the terms of use: https://www.oracle.com/downloads/licenses/oracle-linux-license.html