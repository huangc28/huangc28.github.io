# Uncle atuu vendor extensions Releases

This write up serves as a guideline to release new uncle atuu extension.

## Append new extension info in Packages

Add the newly extension package info in this file. Following the template below

```
Package: com.huangc28.com.huangc28.kgtwcollect <--
Version: 0.1.0 <--
Section: Tweaks
Maintainer: Bryan Huang <huangchiheng@gmail.com>
Depends: firmware (>7.0), mobilesubstrate
Architecture: iphoneos-arm
Filename: ./debs/kgtwimport.deb <--
Size: 43838 <--
MD5sum: ed7ddcf06e0061a6fcf3b8e5fe464949 <--
Description: kgtw collector
Name: 採集-傳說對決 <--
Author: Bryan Huang <huangchiheng@gmail.com>
Depiction: https://huangc28.github.io/depictions/?p=com.huangc28.kgtw-import
```

Fields marked with `<-` are mandatory. Follow the instructions below to fill up the those fields properly.

## Build production .deb of the extension

Prompt the following command in your project root directory:

```
FINALPACKAGE=1 make do
```

or execute `build.sh` scripts:

```
./build.sh
```

Content of `build.sh` can be found [here](https://gist.github.com/huangc28/4583c1aa6f9f8a7cbfa0414786985d27)

It produces a production `.deb` file located in `packages` folder. Move this `.deb` to `debs` folder in this repository. You can rename this file as we will refer to the .deb file in extension package info mentioned aboved.

```
com.huangc28.kgtwcollect_0.1.0_iphoneos-arm.deb
```

## Retrieve .deb size

```
$ls -ls packages/com.huangc28.kgtwcollect_0.1.0_iphoneos-arm.deb

# promps result

32 -rw-r--r--  1 huangchihan  staff  14096 Jan  4 15:43 packages/com.huangc28.kgtwcollect_0.1.0_iphoneos-arm.deb
```

From the result above, size is 14096 bytes.

## Retrieve md5 hash of .deb file

```
md5 com.huangc28.kgtwcollect_0.1.0_iphoneos-arm.deb

```

## Generate Packages.bz2 file

Once we've done filling up the package detail for that extension, we need to generate Package.bz2 file so that cydia can enlist the extension into our source.


```
rm Package.bz2

bzip2 -k Packages
```

Push to remote repository to let it take effect. You should see this new extension listed in the source once refreshed.
