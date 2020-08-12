```
ruby ./generate_data.rb > input_data.txt
go build
time cat input_data.txt | ./experiment-go-map-transformation
```

- To try out different algorithms - update `main.go` and rebuild.
- To try out different flavors of data - update `generate_data.rb`.