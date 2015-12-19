# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$23.Eki.2015 01:07:39$"

import argparse
from werkzeug.wrappers import Request, Response
from werkzeug.serving import run_simple

from jsonrpc import JSONRPCResponseManager, dispatcher
from api import dispatcher
manager = JSONRPCResponseManager()

@Request.application
def application(request):
    response = manager.handle(request.get_data(cache=False, as_text=True), dispatcher)
    return Response(response.json, mimetype='application/json')

def parse_args(arguments=None):
    parser = argparse.ArgumentParser()
    parser.add_argument('-P', '--port', type=int, default=4000, help='server port')
    parser.add_argument('-H', '--host', default='127.0.0.1', help='server host')
    return parser.parse_args(arguments)

if __name__ == '__main__':
    args = parse_args()    
    run_simple(args.host, args.port, application)

