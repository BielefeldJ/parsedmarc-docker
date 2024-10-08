# :e-mail: parsedmarc-dockerized
## :information_source: Info
This stack includes:
- [ParseDMARC](https://domainaware.github.io/parsedmarc/) image to analizing reports (builded from Dockerfile, use pypy image)
- [Elasticsearch & Kibana](https://www.elastic.co/guide/index.html) to store and visualize parsed data

## :shield: Security note
Please note that the Fail2Ban technique is not implemented, so posting this project on the Internet :globe_with_meridians: can be risky. 

You yourself are responsible for your actions.

The author recommends restricting Nginx access only to trusted IP addresses.

The project is delivered as is without any warranty.

To update parsedmarc:
```
cd parsedmarc-docker
docker compose build --no-cache --pull parsedmarc
docker compose pull
docker compose up -d
```

## :gear: How-to deploy from scratch
First of all you need to have :whale: Docker and :octocat: Docker Compose.

1. Learn how to install [Docker](https://docs.docker.com/install/) and [Docker Compose](https://docs.docker.com/compose/install/).

2. Clone the master branch of the repository.
```
git clone https://github.com/BielefeldJ/parsedmarc-docker.git
cd parsedmarc-docker
```

3. Change `parsedmarc.imap` configuration and tweak other env to your needs in `docker-compose.yml`.
Syntax and description avaible [here](https://domainaware.github.io/parsedmarc/index.html#configuration-file)

4. Geolocation data

Create an account and generate a licence key at
[maxmind](https://support.maxmind.com/hc/en-us/articles/4407099783707-Create-an-Account#h_01G4G4PCYASZM87D1WPVWC97D6). And
update GEOIPUPDATE_ACCOUNT_ID and GEOIPUPDATE_LICENSE_KEY in the
`docker-compose`

For more information refer to [GeoIP Update
software](https://github.com/maxmind/geoipupdate) github page

5. Tune `vm.max_map_count` on your OS, original how-to avaible [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html).

6. Start stack.
```
docker compose up -d
```

10. Download & Import Kibana Saved Objects [export.ndjson](https://raw.githubusercontent.com/domainaware/parsedmarc/master/kibana/export.ndjson).

Go to `https://parsedmarc.example.com/app/management/kibana/objects` click on `Import`.

Import downloaded export.ndjson with override.

## Dashboard Sample
![ParceDMARC-Sample](https://github.com/BielefeldJ/parsedmarc-docker/raw/master/ParceDMARC-Sample.png)
