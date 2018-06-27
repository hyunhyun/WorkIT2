package com.spring.controller;

import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import com.mysql.jdbc.MysqlDataTruncation;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.spring.model.DBException;
import com.spring.model.InputException;

@ControllerAdvice
public class ExceptionHandlerClass {
		private final Logger logger = LoggerFactory.getLogger(this.getClass());

	

	@ExceptionHandler(value = NoSuchAlgorithmException.class)
	@ResponseStatus(HttpStatus.PRECONDITION_FAILED)
	public String badCondition(Exception exception) {
		
		logger.error(exception.getClass().getName() + " error : " + exception.getMessage());
		
		return exception.getMessage();
	}
	
	
	@ExceptionHandler(value = InputException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String badRequest(InputException exception) {
		
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		
		return exception.getMessage();
	}
	
	
/*	@ExceptionHandler(value = MySQLIntegrityConstraintViolationException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public String badMySqlRequest(MySQLIntegrityConstraintViolationException exception) {
		
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		
//		return exception.getMessage();
		return "test";
	}
	*/
	
	
	@ExceptionHandler(value = DataIntegrityViolationException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String badMySqlRequest(DataIntegrityViolationException exception) {
		
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		
		return exception.getMessage();
	}
	
	
	@ExceptionHandler(value = MethodArgumentTypeMismatchException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String typeMisMatch(MethodArgumentTypeMismatchException exception) {
		//type mismatch�ε� topicID�� teamID �Ѱܾ� �Ǵµ�
		//topicID�� teamID �ʱ�ȭ �ȵǸ� ""�Ǽ� ���ڰ� �ƴ� string �Ǽ� ����
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		
		return exception.getMessage();
	}
	
//	@ExceptionHandler(value = IOException.class)
//	@ResponseStatus(HttpStatus.)
//	@ResponseBody
//	public String badMySqlRequest(InputException exception) {
//		
//		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
//		
//		return exception.getMessage();
//	}
//	
	
	@ExceptionHandler(value=DBException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public String badDBService(DBException exception) {
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		
		return exception.getMessage();
	}
	
	@ExceptionHandler(value = NullPointerException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String badMySqlRequest(InputException exception) {
		
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		
		return "잘못된 요청입니다";
	}
	
	@ExceptionHandler(value=MysqlDataTruncation.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	public String tooLongRequest(Exception exception) {
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		exception.getCause();
		
		return "DB에 에러가 발생했습니다";
	}
	
	@ExceptionHandler(value = Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public String ExceptionHandle(Exception exception) {
		
		logger.error(exception.getClass().getName() + " error :" + exception.getMessage());
		
		return "서버상의 이유로 요청하신 서비스를 실행할 수 없습니다";
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
