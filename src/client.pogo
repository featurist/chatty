app = angular.module('Chatty', [])

app.factory 'socket' @($root scope)

    socket = io.connect()
    {
        on (event name, callback) =
            socket.on (event name)  
                args = arguments
                $root scope.$apply
                    callback.apply(socket, args)
        
        emit (event name, data, callback) =
            socket.emit (event name, data)
                args = arguments
                $root scope.$apply
                    if (callback)
                        callback.apply(socket, args)
    }

app.controller 'ChatController' @($scope, socket, $http)
    
    posts request = $http { method = 'GET', url = '/posts' }
    
    posts request.success @(data, status, headers, config)
        $scope.posts = data
    
    posts request.error @(data, status, headers, config)
        console.log("ERROR", arguments)

    $scope.posts = []
 
    $scope.postMessage() =
        socket.emit 'post' { text = $scope.messageText }
        $scope.messageText = ''
        
    socket.on 'post' @(message)
        $scope.posts.push (message)
        
app.directive 'timeago' @($timeout)
    timeago (scope, element, attrs) =
        refresh date() =
            element.text(moment(element.attr('data-date')).from now())
            timeout id := $timeout(refresh date, 10000)
            
        timeout id = $timeout(refresh date, 1)
        element.bind '$destroy'
            $timeout.cancel(timeout id)

app.directive 'postOnEnter'
    keyup(scope, element, attrs) =
        element.bind "keyup" @(event)
            if (event.keyCode == 13)
                event.preventDefault()
                scope.postMessage()

automatic scroll () =
    
    following = true
    
    follow bottom () =
        if (following)
            window.scroll(0, document.body.offsetHeight)
            document.get element by id 'message'.focus()
    
    set interval (follow bottom, 100)
    
    scrolled to top () =
        console.log('top')
    
    scrolled to middle () =
        following := false

    scrolled to bottom () =
        following := true

    scroll (ev) =
        st = Math.max(document.documentElement.scrollTop, document.body.scrollTop)
        if (!st)
            scrolled to top ()
        else if ((st + document.documentElement.clientHeight) >= document.documentElement.scrollHeight)
            scrolled to bottom ()
        else
            scrolled to middle ()

    if (window.addEventListener)
        window.addEventListener('scroll', scroll)
    else if (window.attachEvent)
        window.attachEvent('onscroll', scroll)

automatic scroll ()
