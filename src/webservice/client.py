from proxy import Proxy, RequestError

endpoint = ('127.0.0.1', 4000)


def main():
    proxy = Proxy(endpoint)
    # print(proxy.isBoxStarted("aksampazari", "Aksam2015Pazar#", "1196", "test"))
    print(proxy.getLatestLayout("test", "test", "test", 1))

if __name__ == "__main__":
    main()