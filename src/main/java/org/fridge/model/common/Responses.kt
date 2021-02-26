package org.fridge.model.common

object Responses {
    @JvmStatic
    fun <T> validateError() = Response<T>(Tokens.validateError)

    @JvmStatic
    fun <T> validateError(message: String) = Response<T>(Tokens.validateError, message)

    @JvmStatic
    fun <T> validateError(message: String, data: T) = Response(Tokens.validateError, message, data)

    @JvmStatic
    fun <T> validateError(data: T) = Response(Tokens.validateError, data)

    @JvmStatic
    fun <T> ok() = Response<T>(Tokens.ok)

    @JvmStatic
    fun <T> ok(message: String) = Response<T>(Tokens.ok, message)

    @JvmStatic
    fun <T> ok(message: String, data: T) = Response(Tokens.ok, message, data)

    @JvmStatic
    fun <T> ok(data: T) = Response(Tokens.ok, data)

    @JvmStatic
    fun <T> fail() = Response<T>(Tokens.failed)

    @JvmStatic
    fun <T> fail(message: String) = Response<T>(Tokens.failed, message)

    @JvmStatic
    fun <T> fail(message: String, data: T) = Response(Tokens.failed, message, data)

    @JvmStatic
    fun <T> fail(data: T) = Response(Tokens.failed, data)

    /**
     * return a response with token, which is stored in @Tokens
     * @see ResponseToken
     */
    @JvmStatic
    fun <T> withToken(token: ResponseToken) = Response<T>(token)

    /**
     * return a response with token and message, which is stored in @Tokens
     * @see ResponseToken
     */
    @JvmStatic
    fun <T> withToken(token: ResponseToken, message: String) = Response<T>(token, message)

    /**
     * return a response with token, message and data, which is stored in @Tokens
     * @see ResponseToken
     */
    @JvmStatic
    fun <T> withToken(token: ResponseToken, message: String, data: T) = Response<T>(token, message, data)

    /**
     * return a response with token and data, which is stored in @Tokens
     * @see ResponseToken
     */
    @JvmStatic
    fun <T> withToken(token: ResponseToken, data: T) = Response(token, data)

    /**
     * return a response with code and summary \\
     * [be careful to use this function, please replace it with withToken(...)
     * and then add a token in @Tokens]
     */
    @JvmStatic
    fun <T> code(code: Int, summary: String) = Response<T>(code, summary)

    /**
     * return a response with code, summary and message \\
     * [be careful to use this function, please replace it with withToken(...)
     * and then add a token in @Tokens]
     */
    @JvmStatic
    fun <T> code(code: Int, summary: String, message: String) = Response<T>(code, summary, message)

    /**
     * return a response with code, summary, message, data \\
     * [be careful to use this function, please replace it with withToken(...)
     * and then add a token in @Tokens]
     */
    @JvmStatic
    fun <T> code(code: Int, summary: String, message: String, data: T) = Response<T>(code, summary, message, data)

    /**
     * return a response with code, summary, message="", data \\
     * [be careful to use this function, please replace it with withToken(...)
     * and then add a token in @Tokens]
     */
    @JvmStatic
    fun <T> code(code: Int, summary: String, data: T) = Response<T>(code, summary, "", data)
}