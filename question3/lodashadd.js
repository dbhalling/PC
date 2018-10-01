var add = require('lodash/add')

var convert = require('lodash/fp/convert'),
    add = convert('add', add);

add.placeholder = require('lodash/fp/placeholder');
module.exports = add;


console.log(add(6)(4));
