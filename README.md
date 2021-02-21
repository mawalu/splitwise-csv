# splitwise-csv

A small script to export [Splitwise](https://www.splitwise.com/) transaction as CSV so that they can easily be imported into a (plaintext) accounting system like ledger-cli or [hledger](https://hledger.org/). Splitwise already provides a CSV export but only for individual groups and not for all recent transactions.

## Usage

* Ensure you have curl and jq installed.
* Register an OAuth application with Splitwise [here](https://secure.splitwise.com/apps). After that, the page allows you to generate an API key that works as Bearer token.
* Get your Splitwise user id. One way to get this is to call the Splitwise API with your newly obtained token:
```shell
$ curl -s -H "Authorization: Bearer $SPLITWISE_KEY" https://secure.splitwise.com/api/v3.0/get_current_user | jq ".user.id"
```
* Update `splitwise.sh` to include your key and user id or set the `SPLITWISE_USER` and `SPLITWISE_KEY` environment variables.
* Run the script to get the CSV export. If you use hledger you can use the `example.rules` files to get some inspiration for your import rules.

## License

MIT
