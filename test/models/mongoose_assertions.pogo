invalid error (model, err) =
    message = "Invalid #(model.constructor.model name):"
    for @(name) in (err.errors)
        message := "#(message)\n- #(err.errors.(name).message)"
    
    @new Error(message)

valid error (model) =
    @new Error "#(model.constructor.model name) should be invalid, but it's valid"

exports.valid (model, callback) =
    model.validate @(err)
        if (err)
            callback (invalid error (model, err))
        else
            callback (nil)

exports.invalid (model, callback) =
    model.validate @(err)
        if (err)
            callback (nil)
        else
            callback (valid error (model))