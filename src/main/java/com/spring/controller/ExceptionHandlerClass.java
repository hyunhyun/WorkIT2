package com.spring.controller;

import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class ExceptionHandlerClass {
		private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@ExceptionHandler(value = Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public String ExceptionHandle(Exception exception) {
		
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		
		return exception.getMessage();
	}

	@ExceptionHandler(value = NoSuchAlgorithmException.class)
	@ResponseStatus(HttpStatus.PRECONDITION_FAILED)
	public String badCondition(Exception exception) {
		
		logger.error(exception.getClass().getName() + " error : " + exception.getMessage());
		
		return exception.getMessage();
	}

}

//@ControllerAdvice
//public class ControllerExceptionHandler {
//	private final Logger log = LoggerFactory.getLogger(this.getClass());
//
//	@ExceptionHandler(value = Exception.class)
//	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
//	protected ErrorMessage handleConflict(Exception ex, WebRequest request) {
//		log.error(ex.getClass().getName() + ": " + ex.getMessage());
//		exceptionTrace(ex.getStackTrace());
//		ErrorMessage error = new ErrorMessage();
//		error.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.toString());
//		error.setMessage(ex.getMessage());
//		return error;
//	}
