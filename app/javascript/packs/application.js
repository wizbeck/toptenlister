// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"

Rails.start()
Turbolinks.start()

require("jquery")
require("@popperjs/core")
require("bootstrap")
import 'bootstrap/dist/css/bootstrap.min.css';
// Import new javascript files here:
import '../src'
