// Global configuration {{{
// Built-in {{{
// Don't let kill-buffer close the window
can_kill_last_buffer = false;
// don't use a new window for the download buffer
download_buffer_automatic_open_target = [OPEN_NEW_BUFFER_BACKGROUND, OPEN_NEW_WINDOW];
// display the url before going to it in hints mode
hints_display_url_panel = true;

homepage = "http://www.mathematics.thetangentbundle.net/wiki/Special:Random"
load_paths.unshift("chrome://conkeror-contrib/content/");

// keep the found item selected after search mode ends
isearch_keep_selection = true;
// always use autocompletion in the minibuffer
minibuffer_auto_complete_default = true;
// T and O shouldn't leave the url highlighted
minibuffer_read_url_select_initial = false;
// use bookmarks rather than history for url completion (history gets included
// anyway though)
url_completion_use_bookmarks = false;
url_completion_use_history = true;

// display properties of the current selected node during
// the hints interaction.
hints_display_url_panel = true;

// default directory for downloads and shell commands.
cwd = get_home_directory();
cwd.append("dl");

// external editor.
editor_shell_command = "emacsclient -c";

// view source in your editor.
view_source_use_external_editor = true;

// let xkcd-mode put the funny alt text into the page.
xkcd_add_title = true;

// use a single window, even when external programs open a url in conkeror
url_remoting_fn = load_url_in_new_buffer;
// }}}

// Plugins {{{
require("clicks-in-new-buffer.js"); // {{{
// open new tabs in the background
clicks_in_new_buffer_target = OPEN_NEW_BUFFER_BACKGROUND;
// }}}
require("new-tabs.js"); // {{{
// }}}
require("page-modes/wikipedia.js"); // {{{
// automatically follow "did you mean" links on wikipedia search pages
wikipedia_enable_didyoumean = true;

// }}}
// Additional commands {{{
// Webjumps {{{
define_webjump("imdb", "http://imdb.com/find?q=%s");
define_webjump("cpan", "http://search.cpan.org/search?query=%s&mode=all");
define_webjump("de", "http://pda.leo.org/?lp=ende&lang=de&searchLoc=0&cmpType=relaxed&relink=on&sectHdr=off&spellToler=std&search=%s");
define_webjump("hi", "http://shabdkosh.com/s?e=%s");
define_webjump("trans", "http://translate.google.com/translate_t#auto|en|%s");
define_webjump("github", "http://github.com/%s");
define_webjump("e2", "http://everything2.com/index.pl?node=%s&searchy=search");
define_webjump("man", "http://tozt.net/cgi-bin/man/man2html?query=%s");
define_webjump("s", "http://www.scroogle.org/cgi-bin/nbbw.cgi?Gw=%s");
define_webjump("scrooglessl", "https://ssl.scroogle.org/cgi-bin/nbbwssl.cgi?Gw=%s");
define_webjump("y", "http://www.youtube.com/results?search_query=%s&search=Search");
define_webjump("emacswiki",
    "http://www.google.com/cse?cx=004774160799092323420%3A6-ff2s0o6yi"+
               "&q=%s&sa=Search&siteurl=emacswiki.org%2F",
	       $alternative="http://www.emacswiki.org/");
define_webjump("imdb", "http://imdb.com/find?q=%s");
define_webjump("friday?", "http://docgno.me/is-it-friday-yet.php");
require("page-modes/wikipedia.js");
wikipedia_webjumps_format = "wp-%s"; // controls the names of the webjumps.  default is "wikipedia-%s".
define_wikipedia_webjumps("en", "de", "fr"); // For English, German and French.
// define_wikipedia_webjumps(); // To make use of ALL of the webjumps (200+).
define_webjump("p","http://thepiratebay.org/search/%s");
define_webjump("i","http://www.isohunt.com/torrents/?ihq=%s");
webjumps.g = webjumps.google;
define_webjump("m", "http://www.mangapark.com/search/?q=%s");
define_webjump("w", "http://de.wikipedia.org/wiki/%s");

// keys

require("global-overlay-keymap");
define_key_alias("C-m", "return");
define_key(default_global_keymap, "M-d", "kill-current-buffer");

define_key(content_buffer_normal_keymap, "k", "cmd_scrollLineUp");
define_key(content_buffer_normal_keymap, "j", "cmd_scrollLineDown");

define_key(text_keymap, "C-f", "backward-char");
define_key(text_keymap, "M-b", "backward-word");
define_key(text_keymap, "C-f", "forward-char");
define_key(text_keymap, "M-f", "forward-word");

define_key(minibuffer_keymap, "C-n", "minibuffer-complete");
define_key(minibuffer_keymap, "C-p", "minibuffer-complete-previous");

// history

function history_clear () {
    var history = Cc["@mozilla.org/browser/nav-history-service;1"]
        .getService(Ci.nsIBrowserHistory);
    history.removeAllPages();
}
interactive("history-clear",
	    "Clear the history.",
	    history_clear);

// mouse stuff

require("clicks-in-new-buffer.js");
clicks_in_new_buffer_target = OPEN_NEW_BUFFER_BACKGROUND; // Now buffers open in background.
// Set to 0 = left mouse, 1 = middle mouse, 2 = right mouse
clicks_in_new_buffer_button = 2; //  Now right mouse follows links in new buffers.

function darken_page (I) {
    var styles='* { background: black !important; color: grey !important; }'+
        ':link, :link * { color: #4986dd !important; }'+
        ':visited, :visited * { color: #d75047 !important; }';
    var document = I.buffer.document;
    var newSS=document.createElement('link');
    newSS.rel='stylesheet';
    newSS.href='data:text/css,'+escape(styles);
    document.getElementsByTagName("head")[0].appendChild(newSS);
}
interactive("darken-page", "Darken the page in an attempt to save your eyes.",         darken_page);
define_key(content_buffer_normal_keymap, "C-d", "darken-page");

//theme_load_paths.push("/home/veel/.conkerorrc/stylesheets/"); theme_load("blackened");
interactive("open-webcomics", "open all my webcomics",
            function(I){
                load_url_in_new_buffer("http://www.explosm.com/comics/new/",I.window);
                load_url_in_new_buffer("http://www.smbc-comics.com",I.window);
                load_url_in_new_buffer("http://www.xkcd.com",I.window);
                load_url_in_new_buffer("http://www.murraythenut.com",I.window);
                load_url_in_new_buffer("http://www.abstrusegoose.com",I.window);
                load_url_in_new_buffer("http://www.phdcomics.com/comics.php",I.window);
                load_url_in_new_buffer("http://www.bigfatwhale.com/",I.window);
                load_url_in_new_buffer("http://www.channelate.com/",I.window);
                load_url_in_new_buffer("http://gothomo.com/classic.php?cat=newest/",I.window);
                load_url_in_new_buffer("http://asofterworld.com/",I.window);
                load_url_in_new_buffer("http://qwantz.com/index.php/",I.window);
            });

interactive("open-mangastream", "go to mangastream", "follow",
            $browser_object = "http://www.mangastream.com");
define_key(content_buffer_normal_keymap, "C-2", "open-mangastream");
interactive("open-mangapark", "Go to mangapark", "follow",
            $browser_object = "http://www.mangapark.com/");
define_key(content_buffer_normal_keymap, "C-3", "open-mangapark");
interactive("open-instapaper", "Go to instapaper", "follow",
            $browser_object = "http://www.instapaper.com");
define_key(content_buffer_normal_keymap, "C-c i", "open-instapaper");
interactive("open-explosm", "Go to explosm", "follow",
            $browser_object = "http://www.explosm.com/comics/new/");
define_key(content_buffer_normal_keymap, "C-6", "open-explosm");
interactive("open-smbc-comics", "Go to smbc-comics", "follow",
            $browser_object = "http://www.smbc-comics.com/");
define_key(content_buffer_normal_keymap, "C-7", "open-smbc-comics");
interactive("open-xkcd", "Go to xkcd", "follow",
            $browser_object = "http://www.xkcd.com/");
define_key(content_buffer_normal_keymap, "C-8", "open-xkcd");
interactive("open-murraythenut", "Go to murraythenut.com", "follow",
            $browser_object = "http://www.murraythenut.com/");
define_key(content_buffer_normal_keymap, "C-9", "open-murraythenut");
interactive("open-youtube", "Go to youtube", "follow",
            $browser_object = "http://www.youtube.com/");
define_key(content_buffer_normal_keymap, "C-c C-y", "open-youtube");
interactive("open-derstandard", "Go to derstandard", "follow",
            $browser_object = "http://www.derstandard.at/");
define_key(content_buffer_normal_keymap, "C-5", "open-derstandard");
interactive("open-reddit", "Go to reddit", "follow",
            $browser_object = "http://www.reddit.com/");
define_key(content_buffer_normal_keymap, "C-1", "open-reddit");
interactive("open-archlinux", "Go to Archlinux forums", "follow",
            $browser_object = "http://bbs.archlinux.org/");
define_key(content_buffer_normal_keymap, "C-4", "open-archlinux");

function echo_message (window, message) {
    window.minibuffer.message(message);
}
// search selection in scroogle
interactive("search-scroogle",
        "Search the selection in scroogle",
        function(I) {
            /*
var nsio; // instance supporting nsIOutParam

var outobj = new Object(); // make an empty JavaScript object

// 'result' is the method's return value, a string;
var result = nsio.methodHasOutParam(outobj);

// 'outvalue' is the new value of the 'oob' out parameter, a number.
var outvalue = outobj.value; // get the newly-set 'value' property.
            */
            var asdf = new String();
            var text = I.buffer.focused_selection_controller.nsISelectionController.getSelection;
//            var outvalue = asdf.value;
            //var text = yield asdf.nsISelectionController;
            echo_message(I.window,text);
//            load_url_in_new_buffer("http://www.scroogle.org/cgi-bin/nbbw.cgi?Gw="+text);
        }
           );

//            load_url_in_new_buffer("http://www.scroogle.org/cgi-bin/nbbw.cgi?Gw="+text);            
            
define_key(content_buffer_normal_keymap, "C-t", "search-scroogle");

 //returns the selection that the focused window is returning or the selection of the top document if the window is not focused



//doesn't work yet
/*
mouse_back = 1;
mouse_forward = 2;

{
    let navigate_click = function(event) {
        let w = get_recent_conkeror_window().buffers.current.web_navigation;
        if (event.button == mouse_back && w.canGoBack) w.goBack();
        else if (event.button == mouse_forward && w.canGoForward) w.goForward();
        else return;
        event.stopPropagation();
    }

    let install_handler = function (buffer) {
        buffer.browser.addEventListener("click", navigate_click, true);
    }

    add_hook("create_buffer_hook", install_handler);
}
*/

/* untested, should work

// selection searches
function create_selection_search(webjump, key) {
    interactive(webjump+"-selection-search",
                "Search " + webjump + " with selection contents",
                "find-url-new-buffer",
                $browser_object = function (I) {
                    return webjump + " " + I.buffer.top_frame.getSelection();});
    define_key(content_buffer_normal_keymap, key.toUpperCase(), webjump + "-selection-search");

    interactive("prompted-"+webjump+"-search", null,
                function (I) {
                    var term = yield I.minibuffer.read_url($prompt = "Search "+webjump+":",
                                                           $initial_value = webjump+" ");
                    browser_object_follow(I.buffer, FOLLOW_DEFAULT, term);
                });
    define_key(content_buffer_normal_keymap, key, "prompted-" + webjump + "-search");
}
// examples
// create_selection_search("g","l");
// create_selection_search("wikipedia","w");
// create_selection_search("dictionary","d");
// create_selection_search("myspace","y");
// create_selection_search("amazon","a");
// create_selection_search("youtube","u");

*/
//should be used with the above
//minibuffer_read_url_select_initial = false;

//session_pref("network.protocol-handler.external.mailto", false);
//session_pref("network.protocol-handler.app.mailto", "emacs-mailto-handler.sh");

//activate reddit-mode
require("reddit");

external_content_handlers =
    {
        "*": "emacsclient -c",
        text: { "*": "emacsclient -c" },
        image: { "*": "feh" },
        video: { "*": "mplayer" },
        audio: { "*": "mplayer" },
        application: {
            pdf: "xpdf",
            postscript: "gv",
            "x-dvi": "xdvi"
        }
    };

interactive("instapaper", "Send the current page to InstaPaper.",
            function (I) {
                check_buffer(I.buffer, content_buffer);
                let posturl = 'https://www.instapaper.com/api/add?' +
        'username=franziburli@gmx.at&' +
        'password=burliburli&url=' +
                    encodeURIComponent(I.window.content.location.href)
                    '&selection=' +
                    encodeURIComponent(
                        yield I.minibuffer.read(
                            $prompt = "Description (optional): "));
                try {
            var content = yield send_http_request(load_spec({uri: posturl}));
            if (content.responseText == "201") {
               I.window.minibuffer.message("InstaPaper ok!");
            } else {
               I.window.minibuffer.message("Error.");
            }
                } catch (e) { 
                    I.window.minibuffer.message("Error.");
        }
        });

interactive("instapaper-link", "Send the current link to InstaPaper.",
            function (I) {
              bo = yield read_browser_object(I) ;
              mylink = load_spec_uri_string(load_spec(encodeURIComponent(bo)));
              check_buffer(I.buffer, content_buffer);
              let posturl = 'https://www.instapaper.com/api/add?' +
                            'username=franziburli@gmx.at&' +
                            'password=burliburli&url=' + mylink +
                '&title=' + encodeURIComponent(
                                  yield I.minibuffer.read(
                                  $prompt = "Title (optional): ",
                  $initial_value = bo.textContent)) +
                            '&selection=' + encodeURIComponent(
                                  yield I.minibuffer.read(
                                  $prompt = "Description (optional): ",
                  $initial_value = "From: "+ I.buffer.title +" ("+I.window.content.location.href+")"
));
                try {
            var content = yield send_http_request(load_spec({uri: posturl}));
            if (content.responseText == "201") {
               I.window.minibuffer.message("InstaPaper ok!");
            } else {
               I.window.minibuffer.message("Error.");
            }
                } catch (e) { 
                    I.window.minibuffer.message("Error.");
        }
            }, $browser_object = browser_object_links);

define_key(default_global_keymap, "C-x i", "instapaper");
define_key(default_global_keymap, "C-x I", "instapaper-link");

minibuffer.prototype.read_recent_buffer = function () {
    var window = this.window;
    var buffer = this.window.buffers.current;
    keywords(arguments, $prompt = "Buffer:",
             $default = buffer,
             $history = "buffer");
    var buffers = window.buffers.buffer_list.slice(0);
    buffers.push(buffers.shift());
    var completer = all_word_completer(
        $completions = buffers,
        $get_string = function (x) x.title,
        $get_description = function (x) x.description);
    var result = yield this.read(
        $keymap = read_buffer_keymap,
        $prompt = arguments.$prompt,
        $history = arguments.$history,
        $completer = completer,
        $match_required = true,
        $auto_complete = "buffer",
        $auto_complete_initial = true,
        $auto_complete_delay = 0,
        $default_completion = arguments.$default);
    yield co_return(result);
};

interactive("switch-to-recent-buffer",
            "Switch to a buffer specified in the minibuffer.  List of buffers "+
            "will be ordered by recency.",
            function (I) {
                switch_to_buffer(
                    I.window,
                    (yield I.minibuffer.read_recent_buffer(
                         $prompt = "Switch to buffer:",
                         $default = (I.window.buffers.count > 1 ?
                                     I.window.buffers.buffer_list[1] :
                                     I.buffer))));
            });

define_key(default_global_keymap, "C-x B", "switch-to-recent-buffer");
define_key(default_global_keymap, "C-tab", "switch-to-recent-buffer");
define_key(read_buffer_keymap, "C-tab", "minibuffer-complete");
define_key(read_buffer_keymap, "C-S-tab", "minibuffer-complete-previous");