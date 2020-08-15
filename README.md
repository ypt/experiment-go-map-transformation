## Generate input data
```
ruby ./generate_data.rb > input_data.txt
```
To try out different flavors of data - update `generate_data.rb`.

## Running
### Go implementation
```
go build
time cat input_data.txt | ./experiment-go-map-transformation
```
To try out different algorithms - update `main.go` and rebuild.

### Ruby implementation
```
time cat input_data.txt | ruby ./main.rb
```
To try out different algorithms - update `main.rb`.