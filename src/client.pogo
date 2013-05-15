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

app.controller 'ChatController' @($scope, socket)

    $scope.messages = []
 
    $scope.postMessage() =
        socket.emit 'send:message' { text = $scope.messageText }
        $scope.messages.push { text = $scope.messageText }
        $scope.messageText = ''
        
    socket.on 'send:message' @(message)
        $scope.messages.push (message)
