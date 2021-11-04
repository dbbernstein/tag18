<%@ page import="java.text.MessageFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.MissingResourceException" %>
<%@ page import="java.util.ResourceBundle" %>

<%!

    private String getString( ServletContext application,
              ResourceBundle resourceBundle, String propertyName, Object... args ) {

                String value = propertyName;
                try {
                        value = resourceBundle.getString( propertyName );
                        if ( null != args ) {
                                Locale locale = resourceBundle.getLocale();
                                MessageFormat mf = new MessageFormat( value, locale );
                                value = mf.format( args, new StringBuffer(), null ).toString();
                        }
                }
                catch ( MissingResourceException mre ) {
                application.log( "exception building JSP getting property \""
                        + propertyName + "\" from resource bundle "
                            + resourceBundle, mre );
                }
                return value;
    }

%>
<%
    ServletContext a = application;
    ResourceBundle b = null;
    Locale locale = null;
    boolean showHidden = false;
%>

<!DOCTYPE html>
<html>
<head></head>
<body><p>X</p></body>
</html>
