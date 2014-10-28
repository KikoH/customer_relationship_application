a = ["a", "b", "c", "a", "a", "b"]

a.cycle(1) {|x| puts x if x == "a"}