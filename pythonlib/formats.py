def opencsv(filename):
    import csv
    fstream = open(filename, "r")
    reader = csv.reader(fstream)
    data = []
    for entry in reader:
        data.append(entry)
    fstream.close()
    return data


def columns(data, *columns):
    newdata = []
    for entry in data:
        newdata.append([entry[i] for i in columns])
    return newdata


def writecsv(filename, data):
    import csv
    fstream = open(filename, "w")
    writer = csv.writer(fstream)
    writer.writerows(data)
    fstream.close()
