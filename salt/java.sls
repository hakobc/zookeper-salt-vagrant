openjdk-7-jre-headless:
  pkg.installed

/usr/lib/jvm/java-7-openjdk-amd64:
  file.symlink:
    - target: /usr/lib/java

/usr/lib/java/bin/:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/usr/lib/jvm/java-7-openjdk-amd64/bin/java:
  file.symlink:
    - target: /usr/lib/java/bin/java
