#!/bin/bash

# download key descriptors from Maven Central

# - archetype catalog https://maven.apache.org/archetype/archetype-models/archetype-catalog/archetype-catalog.html
wget -q https://repo.maven.apache.org/maven2/archetype-catalog.xml -O archetype-catalog.xml

# - org.apache.maven.plugins
wget -q https://repo.maven.apache.org/maven2/org/apache/maven/plugins/maven-metadata.xml -O plugins-metadata.xml
# see also https://github.com/hboutemy/mcmm/blob/master/org/apache/maven/plugins/maven-metadata.xml

# - org.codehaus.mojo
wget -q https://repo.maven.apache.org/maven2/org/codehaus/mojo/maven-metadata.xml -O mojo-metadata.xml
# see also https://github.com/hboutemy/mcmm/blob/master/org/codehaus/mojo/maven-metadata.xml
