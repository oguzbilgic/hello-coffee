import {Database, Model} from 'mongorito'

db = new Database('localhost/hello-coffee');
db.connect();

export default class User extends Model

db.register(User);
