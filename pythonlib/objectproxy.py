class listofdict(list):
    def __getattr__(self, attribute):
        return [item[attribute] for item in self]
