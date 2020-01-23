<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row content">
    <div class="columns t10 b10">
        <div id="skylark-term"></div>
    </div>
</div>
<style>
    body.plate .row.content {
        padding: 0;
        background-color: #000;
    }
    #skylark-term {
        padding: 0;
    }
    .terminal-wrapper textarea {
        box-shadow: none;
        min-height: initial;
        min-width: initial;
    }
</style>
<script src="https://cdn.jsdelivr.net/gh/jcubic/jquery.terminal@devel/js/jquery.terminal.min.js"></script>
<link href="https://cdn.jsdelivr.net/gh/jcubic/jquery.terminal@devel/css/jquery.terminal.min.css" rel="stylesheet"/>
<script>
    $(function() {
        $('#skylark-term').terminal(function(command, term) {
            if (command !== '') {
                term.pause();
                $.ajax({
                    url: '/api/v0/tts',
                    data: {
                        text: command
                    },
                    method: 'GET',
                    dataType: 'text',
                    success: function(data) {
                        if (data) {
                            if (data.indexOf("data:audio/wav;base64,") === 0) {
                                var html = "<audio controls autoplay>" +
                                    "<source src=\"" + data + "\" type='audio/wav'>" +
                                    "Your browser does not support the audio element.</audio>";
                                term.echo(html, {raw: true});
                            } else {
                                term.echo(data);
                            }
                        }
                    },
                    error: function (xhr) {
                        if (xhr.status == '413') {
                            alert("The text provided was too long.");
                        }
                    },
                    complete: function () {
                        term.resume();
                    }
                });
            } else {
                term.echo('');
            }
        }, {
            greetings: 'Online Text-To-Speech Web Application\n=====================================\nType what you want to say.',
            name: 'skylark',
            height: 450,
            width: "100%",
            prompt: '> '
        });
    });
</script>