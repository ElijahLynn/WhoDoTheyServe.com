// https://github.com/substack/insert-css?source=cr
// patched to append rather than prepend so app css comes after bootstrap css
var inserted = [];

module.exports = function (css) {
    if (inserted.indexOf(css) >= 0) return;
    inserted.push(css);
    
    var elem = document.createElement('style');
    var text = document.createTextNode(css);
    elem.appendChild(text);

    document.head.appendChild(elem);
};
