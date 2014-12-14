
from collections import Counter, defaultdict
import re
import string

stopwords = ['a', 'the', 'an', 'and']
acceptable = string.ascii_lowercase + ' '
DATA_FILES = [
    'final/en_US/en_US.blogs.txt',
    'final/en_US/en_US.news.txt',
    'final/en_US/en_US.twitter.txt',
]
#DATA_FILES = ['test.txt']


def get_words(doc):
    # lowercase
    doc = doc.lower()
    # punctuation
    for p in string.punctuation + '’':
        doc = doc.replace(p, '')
    # remove all other
    doc = ''.join(
        (ch if ch in acceptable else ' ')
        for ch in doc
    )
    # return word list
    return [
        word for word in re.findall('\w+', doc)
        if word not in stopwords and len(word) < 20
    ]


def bigrams(doc):
    words = get_words(doc)
    while len(words) > 1:
        yield words[:2]
        words = words[1:]


def trigrams(doc):
    words = get_words(doc)
    while len(words) > 2:
        yield ' '.join(words[:2]), words[2]
        words = words[2:]


def read_files(*args):
    for filename in args:
        print("Reading", filename)
        yield from open(filename)


def ngram_generator(func, *args):
    for i, doc in enumerate(read_files(*args), 1):
        if i % 1000 == 0:
            print(i)
        yield from func(doc)


def analyze(func, filename, *args):
    data = defaultdict(Counter)
    for first, second in ngram_generator(func, *args):
        data[first][second] += 1
    with open(filename, 'w') as out:
        for first, seconds in data.items():
            #for second, count in seconds.items():
            #    out.write('{} {} {}\n'.format(first, second, count))
            second = seconds.most_common(1)[0][0]
            out.write('{} {}\n'.format(first, second))


if __name__ == '__main__':
    #analyze(bigrams, 'bigrams.txt', *DATA_FILES)
    analyze(trigrams, 'trigrams.txt', *DATA_FILES)