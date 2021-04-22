import time
import glob
import tornado.web
import tornado.options
from tornado.options import define, options
from tornado.web import RequestHandler
import tornado.httpserver
import tornado.ioloop


define('port', default=8880, help='run port', type=int)


class UploadHandler(RequestHandler):
    """
    get method: rendering the page
         post method: front and back data interaction
    """
    def get(self):
        self.render('upload.html')

    def post(self):
        # picture html page name attribute
        img_list = self.request.files.get('picture')
        for img in img_list:

            # Picture name
            filename = img['filename']

            # Binary data
            content = img['body']

            # save route
            path = './static/images/{}'.format(filename)

            with open(path, 'wb') as f:
                f.write(content)


class IndexHandler(RequestHandler):
    """
         picture display 
    """
    def get(self):
        # glob method, get all the file information that meets the requirements under the specified path, and return all the image paths
        img_names = glob.glob('static/images/*.png')
        # Render the page and pass the parameters to the HTML page
        self.render('index.html', images=img_names)



class Application(tornado.web.Application):
    def __init__(self):
        handlers = [
            (r'/upload', UploadHandler),
            (r'/index', IndexHandler),

        ]
        settings = dict(
            debug=True,
            template_path='template',
            static_path='static'
        )
        super(Application, self).__init__(handlers, **settings)

app = Application()


if __name__ == '__main__':
    tornado.options.parse_command_line()
    print('Listening port:', options.port)
    server = tornado.httpserver.HTTPServer(app)
    server.listen(options.port)
    tornado.ioloop.IOLoop.instance().start()
