openjdk-7-jre-headless:
  pkg.installed

/usr/lib/java:
  file.symlink:
    - target: /usr/lib/jvm/java-7-openjdk-amd64

/usr/lib/java/bin/:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/usr/bin/java:
  file.symlink:
    - target: /usr/lib/jvm/java-7-openjdk-amd64
