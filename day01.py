def twoSum(arr, sum):
    d = {}
    for a in arr:
        if a in d:
            return a, d[a]
        d[sum - a] = a
    return -1, -1


def solution(arr, sum=2020):
    a, b = twoSum(arr, sum)
    return a * b


if __name__ == "__main__":

    with open("./day01input.txt") as f:
        raw = f.read()

    data = [int(d) for d in raw.strip().split()]
    s = solution(data)
    print(s)
