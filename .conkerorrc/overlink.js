
function overlink_predicate (node) {
    if (node instanceof Ci.nsIDOMHTMLEmbedElement ||
        node instanceof Ci.nsIDOMHTMLObjectElement)
        return node;
    while (node && !(node instanceof Ci.nsIDOMHTMLAnchorElement)
           && !(node.hasAttribute && node.hasAttribute("title"))) {
        node = node.parentNode;
    }
    return node;
}

function overlink_update_status (buffer, node) {
    var m = buffer.window.minibuffer;
    if (node) {
        if (node instanceof Ci.nsIDOMHTMLEmbedElement ||
            node instanceof Ci.nsIDOMHTMLObjectElement)
        {
            m.show("(object/embed)");
        } else if (node.hasAttribute && node.hasAttribute("title")) {
            m.show(node.getAttribute("title"));
        } else if (node instanceof Ci.nsIDOMHTMLAnchorElement) {
            m.show(node.getAttribute("href"));
        } else {
            m.clear();
        }
    } else {
        m.clear();
    }
}
