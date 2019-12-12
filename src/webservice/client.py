from proxy import Proxy, RequestError

endpoint = ('127.0.0.1', 4000)


def main():
    proxy = Proxy(endpoint)
    print(proxy.getAllLayouts())

if __name__ == "__main__":
    main()