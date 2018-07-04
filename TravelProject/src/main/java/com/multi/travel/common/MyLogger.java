package com.multi.travel.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.util.StopWatch;

import com.sun.media.jfxmedia.logging.Logger;

@Aspect
public class MyLogger {
	protected Log log=LogFactory.getLog(MyLogger.class);
	
	@Around("execution(* com.multi.myhome1..*(..))")
	public Object logPrint(ProceedingJoinPoint point)
	              throws Throwable{
		
		String type = 
			point.getSignature().getDeclaringTypeName();
		//클래스 이름에 Controller  가 들어가 있으면
		String name="";
		String msg="";
		
		StopWatch sw = new StopWatch();
		
		long startTime = System.currentTimeMillis();
		//1234밀리초만큼 cpu를 뺏는다. 시간지연에 사용
		//정확한 시간이 아니다. 
		//2초를 기다렸는데 그때 다른 프로세스가 cpu를 사용
		//중이면 계속 대기할 수 도 있다
		//Thread.sleep(2000);
		sw.start();
		if(type.indexOf("Controller")>-1)
		{
			name= "Controller :  " + type;
		}
		else if( type.indexOf("Service")>-1)
		{
			name= "Service :  " + type;
		}
		else if(type.indexOf("Dao")>-1)
		{
			name= "Dao :  " + type;
		}
		sw.stop();
		long endTime = System.currentTimeMillis();
		
		msg = String.format("걸린시간 : %d", endTime-startTime);
		log.debug("****** TimeCount ********** " );
		log.debug(name + " : "  + sw.toString());
		
		return point.proceed();
	}
}


