FROM makuk66/docker-solr:4.10.4

# We declare the volume to make sure that the solr index data are persistant

COPY solr_config /temp/solr-drupal-config

RUN cd /temp/solr-drupal-config && cp -f \
  elevate.xml \
  mapping-ISOLatin1Accent.txt \
  protwords.txt \
  schema_extra_fields.xml \
  schema_extra_types.xml \
  schema.xml \
  solrconfig_extra.xml \
  solrconfig.xml \
  solrcore.properties \
  stopwords.txt \
  synonyms.txt \
  /opt/solr-4.10.4/example/solr/collection1/conf/

RUN chown -R solr:solr /opt/solr-4.10.4/example/solr/collection1/conf

EXPOSE 8983

WORKDIR /opt/solr
CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]