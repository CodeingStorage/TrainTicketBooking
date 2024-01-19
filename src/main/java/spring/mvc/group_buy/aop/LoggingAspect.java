package spring.mvc.group_buy.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
	@Before("execution(* spring.mvc.group_buy.controller.*.*(..))")
// springmvc-servlet.xml 41 行<method="logMethodParams"/>
	public void logMethodParams(JoinPoint joinPoint) {
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		System.out.printf("調用方法: %s 參數: %s%n", methodName, Arrays.toString(args));
	}
}