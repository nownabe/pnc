# Positive Negative Classifier for Twitter

PNC judges searched tweets are positive or negative.

## Secreen Shot

# Usage
## Twitter API
PNC uses Twitter API, it requires:

* Consumer key
* Consumer secret
* Access token
* Access token secret

You can get those at [Twitter Developers](https://apps.twitter.com).

## Run
PNC works with Docker.

```bash
docker run \
  -p 3000:3000 \
  -e TWITTER_CONSUMER_KEY="YOUR CONSUMER KEY" \
  -e TWITTER_CONSUMER_SECRET="YOUR CONSUMER SECRET" \
  -e TWITTER_ACCESS_TOKEN="YOUR ACCESS TOKEN" \
  -e TWITTER_ACCESS_TOKEN_SECRET="YOUR ACCESS TOKEN SECRET" \
  nownabe:pnc
```
