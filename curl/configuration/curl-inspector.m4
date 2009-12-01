dnl (foreign net curl sizeof) --
dnl
dnl Part of: Nausicaa
dnl Contents: foreign library inspection generation
dnl Date: Tue Dec  1, 2009
dnl
dnl Abstract
dnl
dnl
dnl
dnl Copyright (c) 2009 Marco Maggi <marco.maggi-ipsu@poste.it>
dnl
dnl This program is free software:  you can redistribute it and/or modify
dnl it under the terms of the  GNU General Public License as published by
dnl the Free Software Foundation, either version 3 of the License, or (at
dnl your option) any later version.
dnl
dnl This program is  distributed in the hope that it  will be useful, but
dnl WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
dnl MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
dnl General Public License for more details.
dnl
dnl You should  have received  a copy of  the GNU General  Public License
dnl along with this program.  If not, see <http://www.gnu.org/licenses/>.
dnl


NAU_DS_WITH_OPTION([CURL_SHARED_OBJECT],[curl-shared-object],[libcurl.so],
  [Curl shared library file],[select Curl shared library file])
NAUSICAA_INSPECT_TYPE([CURL_SOCKET_T],[curl_socket_t],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_OFF_T],[curl_off_t],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLSOCKTYPE],[curlsocktype],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLIOERR],[curlioerr],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLIOCMD],[curliocmd],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_INFOTYPE],[curl_infotype],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLCODE],[CURLcode],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_PROXYTYPE],[curl_proxytype],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_KHSTAT],[enum curl_khstat],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_KHMATCH],[enum curl_khmatch],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_USESSL],[curl_usessl],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_FTPCCC],[curl_ftpccc],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_FTPAUTH],[curl_ftpauth],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_FTPCREATEDIR],[curl_ftpcreatedir],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_FTPMETHOD],[curl_ftpmethod],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLOPTION],[CURLoption],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_NETRC_OPTION],[enum CURL_NETRC_OPTION],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_TIMECOND],[curl_TimeCond],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLFORMOPTION],[CURLformoption],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLFORMCODE],[CURLFORMcode],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLINFO],[CURLINFO],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_CLOSEPOLICY],[curl_closepolicy],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_LOCK_DATA],[curl_lock_data],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURL_LOCK_ACCESS],[curl_lock_access],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLSHCODE],[CURLSHcode],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLSHOPTION],[CURLSHoption],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLVERSION],[CURLversion],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLMCODE],[CURLMcode],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLMSG],[CURLMSG],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([CURLMOPTION],[CURLMoption],[signed-int],[#f])
NAUSICAA_INSPECT_TYPE([TIME_T],[time_t],[signed-int],[#f])

dnl Struct inspection: curl_httppost
NAUSICAA_INSPECT_STRUCT_TYPE([CURL_HTTPPOST],[struct curl_httppost],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_NEXT],[struct curl_httppost],[next],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_NAME],[struct curl_httppost],[name],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_NAMELENGTH],[struct curl_httppost],[namelength],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_CONTENTS],[struct curl_httppost],[contents],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_CONTENTSLENGTH],[struct curl_httppost],[contentslength],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_BUFFER],[struct curl_httppost],[buffer],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_BUFFERLENGTH],[struct curl_httppost],[bufferlength],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_CONTENTTYPE],[struct curl_httppost],[contenttype],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_CONTENTHEADER],[struct curl_httppost],[contentheader],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_MORE],[struct curl_httppost],[more],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_FLAGS],[struct curl_httppost],[flags],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_SHOWFILENAME],[struct curl_httppost],[showfilename],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_HTTPPOST_USERP],[struct curl_httppost],[userp],[pointer])

dnl Struct inspection: curl_sockaddr
NAUSICAA_INSPECT_STRUCT_TYPE([CURL_SOCKADDR],[struct curl_sockaddr],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_SOCKADDR_FAMILY],[struct curl_sockaddr],[family],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_SOCKADDR_SOCKTYPE],[struct curl_sockaddr],[socktype],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_SOCKADDR_PROTOCOL],[struct curl_sockaddr],[protocol],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_SOCKADDR_ADDRLEN],[struct curl_sockaddr],[addrlen],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE_POINTER([CURL_SOCKADDR_ADDR],[struct curl_sockaddr],[addr])

dnl Struct inspection: curl_khkey
NAUSICAA_INSPECT_STRUCT_TYPE([CURL_KHKEY],[struct curl_khkey],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_KHKEY_KEY],[struct curl_khkey],[key],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_KHKEY_LEN],[struct curl_khkey],[len],[unsigned-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_KHKEY_KEYTYPE],[struct curl_khkey],[keytype],[signed-int])

dnl Struct inspection: curl_forms
NAUSICAA_INSPECT_STRUCT_TYPE([CURL_FORMS],[struct curl_forms],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_FORMS_OPTION],[struct curl_forms],[option],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_FORMS_VALUE],[struct curl_forms],[value],[pointer])

dnl Struct inspection: curl_slist
NAUSICAA_INSPECT_STRUCT_TYPE([CURL_SLIST],[struct curl_slist],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_SLIST_DATA],[struct curl_slist],[data],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_SLIST_NEXT],[struct curl_slist],[next],[pointer])

dnl Struct inspection: curl_certinfo
NAUSICAA_INSPECT_STRUCT_TYPE([CURL_CERTINFO],[struct curl_certinfo],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_CERTINFO_NUM_OF_CERTS],[struct curl_certinfo],[num_of_certs],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_CERTINFO_CERTINFO],[struct curl_certinfo],[certinfo],[pointer])

dnl Struct inspection: curl_version_info_data
NAUSICAA_INSPECT_STRUCT_TYPE([CURL_VERSION_INFO_DATA],[curl_version_info_data],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_AGE],[curl_version_info_data],[age],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_VERSION],[curl_version_info_data],[version],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_VERSION_NUM],[curl_version_info_data],[version_num],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_HOST],[curl_version_info_data],[host],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_FEATURES],[curl_version_info_data],[features],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_SSL_VERSION],[curl_version_info_data],[ssl_version],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_SSL_VERSION_NUM],[curl_version_info_data],[ssl_version_num],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_LIBZ_VERSION],[curl_version_info_data],[libz_version],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_PROTOCOLS],[curl_version_info_data],[protocols],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_ARES],[curl_version_info_data],[ares],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_ARES_NUM],[curl_version_info_data],[ares_num],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_LIBIDN],[curl_version_info_data],[libidn],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_ICONV_VER_NUM],[curl_version_info_data],[iconv_ver_num],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURL_VERSION_INFO_DATA_LIBSSH_VERSION],[curl_version_info_data],[libssh_version],[pointer])

dnl Struct inspection: CURLMsg
NAUSICAA_INSPECT_STRUCT_TYPE([CURLMSG],[CURLMsg],[#f])
NAUSICAA_INSPECT_FIELD_TYPE([CURLMSG_MSG],[CURLMsg],[msg],[signed-int])
NAUSICAA_INSPECT_FIELD_TYPE([CURLMSG_EASY_HANDLE],[CURLMsg],[easy_handle],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURLMSG_DATA_WHATEVER],[CURLMsg],[data.whatever],[pointer])
NAUSICAA_INSPECT_FIELD_TYPE([CURLMSG_DATA_RESULT],[CURLMsg],[data.result],[signed-int])

dnl Preprocessor symbols: seek whence values
NAUSICAA_DEFINE_VALUE([SEEK_SET])
NAUSICAA_DEFINE_VALUE([SEEK_CUR])
NAUSICAA_DEFINE_VALUE([SEEK_END])

dnl Preprocessor symbols: miscellaneous constants
NAUSICAA_DEFINE_VALUE([CURL_SOCKET_BAD])
NAUSICAA_DEFINE_VALUE([CURL_MAX_WRITE_SIZE])
NAUSICAA_DEFINE_VALUE([CURL_MAX_HTTP_HEADER])
NAUSICAA_DEFINE_VALUE([CURL_WRITEFUNC_PAUSE])
NAUSICAA_DEFINE_VALUE([CURL_IPRESOLVE_WHATEVER])
NAUSICAA_DEFINE_VALUE([CURL_IPRESOLVE_V4])
NAUSICAA_DEFINE_VALUE([CURL_IPRESOLVE_V6])
NAUSICAA_DEFINE_VALUE([CURLOPT_WRITEDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_READDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_HEADERDATA])
NAUSICAA_DEFINE_VALUE([CURL_HTTP_VERSION_NONE])
NAUSICAA_DEFINE_VALUE([CURL_HTTP_VERSION_1_0])
NAUSICAA_DEFINE_VALUE([CURL_HTTP_VERSION_1_1])
NAUSICAA_DEFINE_VALUE([CURL_HTTP_VERSION_LAST])
NAUSICAA_DEFINE_VALUE([CURL_SSLVERSION_DEFAULT])
NAUSICAA_DEFINE_VALUE([CURL_SSLVERSION_TLSv1])
NAUSICAA_DEFINE_VALUE([CURL_SSLVERSION_SSLv2])
NAUSICAA_DEFINE_VALUE([CURL_SSLVERSION_SSLv3])
NAUSICAA_DEFINE_VALUE([CURL_SSLVERSION_LAST])
NAUSICAA_DEFINE_VALUE([CURL_REDIR_GET_ALL])
NAUSICAA_DEFINE_VALUE([CURL_REDIR_POST_301])
NAUSICAA_DEFINE_VALUE([CURL_REDIR_POST_302])
NAUSICAA_DEFINE_VALUE([CURL_REDIR_POST_ALL])
NAUSICAA_DEFINE_VALUE([CURL_GLOBAL_SSL])
NAUSICAA_DEFINE_VALUE([CURL_GLOBAL_WIN32])
NAUSICAA_DEFINE_VALUE([CURL_GLOBAL_ALL])
NAUSICAA_DEFINE_VALUE([CURL_GLOBAL_NOTHING])
NAUSICAA_DEFINE_VALUE([CURL_GLOBAL_DEFAULT])
NAUSICAA_DEFINE_VALUE([CURLPAUSE_RECV])
NAUSICAA_DEFINE_VALUE([CURLPAUSE_RECV_CONT])
NAUSICAA_DEFINE_VALUE([CURLPAUSE_SEND])
NAUSICAA_DEFINE_VALUE([CURLPAUSE_SEND_CONT])
NAUSICAA_DEFINE_VALUE([CURLPAUSE_ALL])
NAUSICAA_DEFINE_VALUE([CURLPAUSE_CONT])
NAUSICAA_DEFINE_VALUE([CURL_POLL_NONE])
NAUSICAA_DEFINE_VALUE([CURL_POLL_IN])
NAUSICAA_DEFINE_VALUE([CURL_POLL_OUT])
NAUSICAA_DEFINE_VALUE([CURL_POLL_INOUT])
NAUSICAA_DEFINE_VALUE([CURL_POLL_REMOVE])
NAUSICAA_DEFINE_VALUE([CURL_SOCKET_TIMEOUT])
NAUSICAA_DEFINE_VALUE([CURL_CSELECT_IN])
NAUSICAA_DEFINE_VALUE([CURL_CSELECT_OUT])
NAUSICAA_DEFINE_VALUE([CURL_CSELECT_ERR])

dnl String preprocessor symbols: version informations
NAUSICAA_STRING_TEST([LIBCURL_COPYRIGHT],[LIBCURL_COPYRIGHT])
NAUSICAA_STRING_TEST([LIBCURL_TIMESTAMP],[LIBCURL_TIMESTAMP])

dnl Preprocessor symbols: version numbers
NAUSICAA_DEFINE_VALUE([LIBCURL_VERSION_MAJOR])
NAUSICAA_DEFINE_VALUE([LIBCURL_VERSION_MINOR])
NAUSICAA_DEFINE_VALUE([LIBCURL_VERSION_PATCH])
NAUSICAA_DEFINE_VALUE([LIBCURL_VERSION_NUM])

dnl Preprocessor symbols: flag values for the 'flags' field of structure 'curl_httppost'
NAUSICAA_DEFINE_VALUE([HTTPPOST_FILENAME])
NAUSICAA_DEFINE_VALUE([HTTPPOST_READFILE])
NAUSICAA_DEFINE_VALUE([HTTPPOST_PTRNAME])
NAUSICAA_DEFINE_VALUE([HTTPPOST_PTRCONTENTS])
NAUSICAA_DEFINE_VALUE([HTTPPOST_BUFFER])
NAUSICAA_DEFINE_VALUE([HTTPPOST_PTRBUFFER])
NAUSICAA_DEFINE_VALUE([HTTPPOST_CALLBACK])

dnl Preprocessor symbols: return codes for the seek callbacks
NAUSICAA_DEFINE_VALUE([CURL_SEEKFUNC_OK])
NAUSICAA_DEFINE_VALUE([CURL_SEEKFUNC_FAIL])
NAUSICAA_DEFINE_VALUE([CURL_SEEKFUNC_CANTSEEK])

dnl Preprocessor symbols: return codes for the read callbacks
NAUSICAA_DEFINE_VALUE([CURL_READFUNC_ABORT])
NAUSICAA_DEFINE_VALUE([CURL_READFUNC_PAUSE])

dnl Preprocessor symbols: enum curlsocktype
NAUSICAA_DEFINE_VALUE([CURLSOCKTYPE_IPCXN])
NAUSICAA_DEFINE_VALUE([CURLSOCKTYPE_LAST])

dnl Preprocessor symbols: enum curlioerr
NAUSICAA_DEFINE_VALUE([CURLIOE_OK])
NAUSICAA_DEFINE_VALUE([CURLIOE_UNKNOWNCMD])
NAUSICAA_DEFINE_VALUE([CURLIOE_FAILRESTART])
NAUSICAA_DEFINE_VALUE([CURLIOE_LAST])

dnl Preprocessor symbols: enum curliocmd
NAUSICAA_DEFINE_VALUE([CURLIOCMD_NOP])
NAUSICAA_DEFINE_VALUE([CURLIOCMD_RESTARTREAD])
NAUSICAA_DEFINE_VALUE([CURLIOCMD_LAST])

dnl Preprocessor symbols: enum curl_infotype
NAUSICAA_DEFINE_VALUE([CURLINFO_TEXT])
NAUSICAA_DEFINE_VALUE([CURLINFO_HEADER_IN])
NAUSICAA_DEFINE_VALUE([CURLINFO_HEADER_OUT])
NAUSICAA_DEFINE_VALUE([CURLINFO_DATA_IN])
NAUSICAA_DEFINE_VALUE([CURLINFO_DATA_OUT])
NAUSICAA_DEFINE_VALUE([CURLINFO_SSL_DATA_IN])
NAUSICAA_DEFINE_VALUE([CURLINFO_SSL_DATA_OUT])
NAUSICAA_DEFINE_VALUE([CURLINFO_END])

dnl Preprocessor symbols: enum CURLcode
NAUSICAA_DEFINE_VALUE([CURLE_OK])
NAUSICAA_DEFINE_VALUE([CURLE_UNSUPPORTED_PROTOCOL])
NAUSICAA_DEFINE_VALUE([CURLE_FAILED_INIT])
NAUSICAA_DEFINE_VALUE([CURLE_URL_MALFORMAT])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE4])
NAUSICAA_DEFINE_VALUE([CURLE_COULDNT_RESOLVE_PROXY])
NAUSICAA_DEFINE_VALUE([CURLE_COULDNT_RESOLVE_HOST])
NAUSICAA_DEFINE_VALUE([CURLE_COULDNT_CONNECT])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_WEIRD_SERVER_REPLY])
NAUSICAA_DEFINE_VALUE([CURLE_REMOTE_ACCESS_DENIED])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE10])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_WEIRD_PASS_REPLY])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE12])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_WEIRD_PASV_REPLY])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_WEIRD_227_FORMAT])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_CANT_GET_HOST])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE16])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_COULDNT_SET_TYPE])
NAUSICAA_DEFINE_VALUE([CURLE_PARTIAL_FILE])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_COULDNT_RETR_FILE])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE20])
NAUSICAA_DEFINE_VALUE([CURLE_QUOTE_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_HTTP_RETURNED_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_WRITE_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE24])
NAUSICAA_DEFINE_VALUE([CURLE_UPLOAD_FAILED])
NAUSICAA_DEFINE_VALUE([CURLE_READ_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_OUT_OF_MEMORY])
NAUSICAA_DEFINE_VALUE([CURLE_OPERATION_TIMEDOUT])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE29])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_PORT_FAILED])
NAUSICAA_DEFINE_VALUE([CURLE_FTP_COULDNT_USE_REST])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE32])
NAUSICAA_DEFINE_VALUE([CURLE_RANGE_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_HTTP_POST_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_CONNECT_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_BAD_DOWNLOAD_RESUME])
NAUSICAA_DEFINE_VALUE([CURLE_FILE_COULDNT_READ_FILE])
NAUSICAA_DEFINE_VALUE([CURLE_LDAP_CANNOT_BIND])
NAUSICAA_DEFINE_VALUE([CURLE_LDAP_SEARCH_FAILED])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE40])
NAUSICAA_DEFINE_VALUE([CURLE_FUNCTION_NOT_FOUND])
NAUSICAA_DEFINE_VALUE([CURLE_ABORTED_BY_CALLBACK])
NAUSICAA_DEFINE_VALUE([CURLE_BAD_FUNCTION_ARGUMENT])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE44])
NAUSICAA_DEFINE_VALUE([CURLE_INTERFACE_FAILED])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE46])
NAUSICAA_DEFINE_VALUE([CURLE_TOO_MANY_REDIRECTS])
NAUSICAA_DEFINE_VALUE([CURLE_UNKNOWN_TELNET_OPTION])
NAUSICAA_DEFINE_VALUE([CURLE_TELNET_OPTION_SYNTAX])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE50])
NAUSICAA_DEFINE_VALUE([CURLE_PEER_FAILED_VERIFICATION])
NAUSICAA_DEFINE_VALUE([CURLE_GOT_NOTHING])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_ENGINE_NOTFOUND])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_ENGINE_SETFAILED])
NAUSICAA_DEFINE_VALUE([CURLE_SEND_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_RECV_ERROR])
NAUSICAA_DEFINE_VALUE([CURLE_OBSOLETE57])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_CERTPROBLEM])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_CIPHER])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_CACERT])
NAUSICAA_DEFINE_VALUE([CURLE_BAD_CONTENT_ENCODING])
NAUSICAA_DEFINE_VALUE([CURLE_LDAP_INVALID_URL])
NAUSICAA_DEFINE_VALUE([CURLE_FILESIZE_EXCEEDED])
NAUSICAA_DEFINE_VALUE([CURLE_USE_SSL_FAILED])
NAUSICAA_DEFINE_VALUE([CURLE_SEND_FAIL_REWIND])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_ENGINE_INITFAILED])
NAUSICAA_DEFINE_VALUE([CURLE_LOGIN_DENIED])
NAUSICAA_DEFINE_VALUE([CURLE_TFTP_NOTFOUND])
NAUSICAA_DEFINE_VALUE([CURLE_TFTP_PERM])
NAUSICAA_DEFINE_VALUE([CURLE_REMOTE_DISK_FULL])
NAUSICAA_DEFINE_VALUE([CURLE_TFTP_ILLEGAL])
NAUSICAA_DEFINE_VALUE([CURLE_TFTP_UNKNOWNID])
NAUSICAA_DEFINE_VALUE([CURLE_REMOTE_FILE_EXISTS])
NAUSICAA_DEFINE_VALUE([CURLE_TFTP_NOSUCHUSER])
NAUSICAA_DEFINE_VALUE([CURLE_CONV_FAILED])
NAUSICAA_DEFINE_VALUE([CURLE_CONV_REQD])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_CACERT_BADFILE])
NAUSICAA_DEFINE_VALUE([CURLE_REMOTE_FILE_NOT_FOUND])
NAUSICAA_DEFINE_VALUE([CURLE_SSH])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_SHUTDOWN_FAILED])
NAUSICAA_DEFINE_VALUE([CURLE_AGAIN])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_CRL_BADFILE])
NAUSICAA_DEFINE_VALUE([CURLE_SSL_ISSUER_ERROR])
NAUSICAA_DEFINE_VALUE([CURL_LAST])

dnl Preprocessor symbols: enum curl_proxytype
NAUSICAA_DEFINE_VALUE([CURLPROXY_HTTP])
NAUSICAA_DEFINE_VALUE([CURLPROXY_HTTP_1_0])
NAUSICAA_DEFINE_VALUE([CURLPROXY_SOCKS4])
NAUSICAA_DEFINE_VALUE([CURLPROXY_SOCKS5])
NAUSICAA_DEFINE_VALUE([CURLPROXY_SOCKS4A])
NAUSICAA_DEFINE_VALUE([CURLPROXY_SOCKS5_HOSTNAME])

dnl Preprocessor symbols: auth constants
NAUSICAA_DEFINE_VALUE([CURLAUTH_NONE])
NAUSICAA_DEFINE_VALUE([CURLAUTH_BASIC])
NAUSICAA_DEFINE_VALUE([CURLAUTH_DIGEST])
NAUSICAA_DEFINE_VALUE([CURLAUTH_GSSNEGOTIATE])
NAUSICAA_DEFINE_VALUE([CURLAUTH_NTLM])
NAUSICAA_DEFINE_VALUE([CURLAUTH_DIGEST_IE])
NAUSICAA_DEFINE_VALUE([CURLAUTH_ANY])
NAUSICAA_DEFINE_VALUE([CURLAUTH_ANYSAFE])
NAUSICAA_DEFINE_VALUE([CURLSSH_AUTH_ANY])
NAUSICAA_DEFINE_VALUE([CURLSSH_AUTH_NONE])
NAUSICAA_DEFINE_VALUE([CURLSSH_AUTH_PUBLICKEY])
NAUSICAA_DEFINE_VALUE([CURLSSH_AUTH_PASSWORD])
NAUSICAA_DEFINE_VALUE([CURLSSH_AUTH_HOST])
NAUSICAA_DEFINE_VALUE([CURLSSH_AUTH_KEYBOARD])
NAUSICAA_DEFINE_VALUE([CURLSSH_AUTH_DEFAULT])
NAUSICAA_DEFINE_VALUE([CURL_ERROR_SIZE])

dnl Preprocessor symbols: enum keytype
NAUSICAA_DEFINE_VALUE([CURLKHTYPE_UNKNOWN])
NAUSICAA_DEFINE_VALUE([CURLKHTYPE_RSA1])
NAUSICAA_DEFINE_VALUE([CURLKHTYPE_RSA])
NAUSICAA_DEFINE_VALUE([CURLKHTYPE_DSS])

dnl Preprocessor symbols: enum curl_khstat
NAUSICAA_DEFINE_VALUE([CURLKHSTAT_FINE_ADD_TO_FILE])
NAUSICAA_DEFINE_VALUE([CURLKHSTAT_FINE])
NAUSICAA_DEFINE_VALUE([CURLKHSTAT_REJECT])
NAUSICAA_DEFINE_VALUE([CURLKHSTAT_DEFER])
NAUSICAA_DEFINE_VALUE([CURLKHSTAT_LAST])

dnl Preprocessor symbols: enum curl_khmatch
NAUSICAA_DEFINE_VALUE([CURLKHMATCH_OK])
NAUSICAA_DEFINE_VALUE([CURLKHMATCH_MISMATCH])
NAUSICAA_DEFINE_VALUE([CURLKHMATCH_MISSING])
NAUSICAA_DEFINE_VALUE([CURLKHMATCH_LAST])

dnl Preprocessor symbols: enum curl_usessl
NAUSICAA_DEFINE_VALUE([CURLUSESSL_NONE])
NAUSICAA_DEFINE_VALUE([CURLUSESSL_TRY])
NAUSICAA_DEFINE_VALUE([CURLUSESSL_CONTROL])
NAUSICAA_DEFINE_VALUE([CURLUSESSL_ALL])
NAUSICAA_DEFINE_VALUE([CURLUSESSL_LAST])

dnl Preprocessor symbols: enum curl_ftpccc
NAUSICAA_DEFINE_VALUE([CURLFTPSSL_CCC_NONE])
NAUSICAA_DEFINE_VALUE([CURLFTPSSL_CCC_PASSIVE])
NAUSICAA_DEFINE_VALUE([CURLFTPSSL_CCC_ACTIVE])
NAUSICAA_DEFINE_VALUE([CURLFTPSSL_CCC_LAST])

dnl Preprocessor symbols: curl_ftpauth
NAUSICAA_DEFINE_VALUE([CURLFTPAUTH_DEFAULT])
NAUSICAA_DEFINE_VALUE([CURLFTPAUTH_SSL])
NAUSICAA_DEFINE_VALUE([CURLFTPAUTH_TLS])
NAUSICAA_DEFINE_VALUE([CURLFTPAUTH_LAST])

dnl Preprocessor symbols: enum curl_ftpcreatedir
NAUSICAA_DEFINE_VALUE([CURLFTP_CREATE_DIR_NONE])
NAUSICAA_DEFINE_VALUE([CURLFTP_CREATE_DIR])
NAUSICAA_DEFINE_VALUE([CURLFTP_CREATE_DIR_RETRY])
NAUSICAA_DEFINE_VALUE([CURLFTP_CREATE_DIR_LAST])

dnl Preprocessor symbols: enum curl_ftpmethod
NAUSICAA_DEFINE_VALUE([CURLFTPMETHOD_DEFAULT])
NAUSICAA_DEFINE_VALUE([CURLFTPMETHOD_MULTICWD])
NAUSICAA_DEFINE_VALUE([CURLFTPMETHOD_NOCWD])
NAUSICAA_DEFINE_VALUE([CURLFTPMETHOD_SINGLECWD])
NAUSICAA_DEFINE_VALUE([CURLFTPMETHOD_LAST])

dnl Preprocessor symbols: CURLPROTO_ defines are for the CURLOPT_*PROTOCOLS options
NAUSICAA_DEFINE_VALUE([CURLPROTO_HTTP])
NAUSICAA_DEFINE_VALUE([CURLPROTO_HTTPS])
NAUSICAA_DEFINE_VALUE([CURLPROTO_FTP])
NAUSICAA_DEFINE_VALUE([CURLPROTO_FTPS])
NAUSICAA_DEFINE_VALUE([CURLPROTO_SCP])
NAUSICAA_DEFINE_VALUE([CURLPROTO_SFTP])
NAUSICAA_DEFINE_VALUE([CURLPROTO_TELNET])
NAUSICAA_DEFINE_VALUE([CURLPROTO_LDAP])
NAUSICAA_DEFINE_VALUE([CURLPROTO_LDAPS])
NAUSICAA_DEFINE_VALUE([CURLPROTO_DICT])
NAUSICAA_DEFINE_VALUE([CURLPROTO_FILE])
NAUSICAA_DEFINE_VALUE([CURLPROTO_TFTP])
NAUSICAA_DEFINE_VALUE([CURLPROTO_ALL])

dnl Preprocessor symbols: enum CURLoption
NAUSICAA_DEFINE_VALUE([CURLOPT_FILE])
NAUSICAA_DEFINE_VALUE([CURLOPT_URL])
NAUSICAA_DEFINE_VALUE([CURLOPT_PORT])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROXY])
NAUSICAA_DEFINE_VALUE([CURLOPT_USERPWD])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROXYUSERPWD])
NAUSICAA_DEFINE_VALUE([CURLOPT_RANGE])
NAUSICAA_DEFINE_VALUE([CURLOPT_INFILE])
NAUSICAA_DEFINE_VALUE([CURLOPT_ERRORBUFFER])
NAUSICAA_DEFINE_VALUE([CURLOPT_WRITEFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_READFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_TIMEOUT])
NAUSICAA_DEFINE_VALUE([CURLOPT_INFILESIZE])
NAUSICAA_DEFINE_VALUE([CURLOPT_POSTFIELDS])
NAUSICAA_DEFINE_VALUE([CURLOPT_REFERER])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTPPORT])
NAUSICAA_DEFINE_VALUE([CURLOPT_USERAGENT])
NAUSICAA_DEFINE_VALUE([CURLOPT_LOW_SPEED_LIMIT])
NAUSICAA_DEFINE_VALUE([CURLOPT_LOW_SPEED_TIME])
NAUSICAA_DEFINE_VALUE([CURLOPT_RESUME_FROM])
NAUSICAA_DEFINE_VALUE([CURLOPT_COOKIE])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTPHEADER])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTPPOST])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSLCERT])
NAUSICAA_DEFINE_VALUE([CURLOPT_KEYPASSWD])
NAUSICAA_DEFINE_VALUE([CURLOPT_CRLF])
NAUSICAA_DEFINE_VALUE([CURLOPT_QUOTE])
NAUSICAA_DEFINE_VALUE([CURLOPT_WRITEHEADER])
NAUSICAA_DEFINE_VALUE([CURLOPT_COOKIEFILE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSLVERSION])
NAUSICAA_DEFINE_VALUE([CURLOPT_TIMECONDITION])
NAUSICAA_DEFINE_VALUE([CURLOPT_TIMEVALUE])
NAUSICAA_DEFINE_VALUE([CURLOPT_CUSTOMREQUEST])
NAUSICAA_DEFINE_VALUE([CURLOPT_STDERR])
NAUSICAA_DEFINE_VALUE([CURLOPT_POSTQUOTE])
NAUSICAA_DEFINE_VALUE([CURLOPT_WRITEINFO])
NAUSICAA_DEFINE_VALUE([CURLOPT_VERBOSE])
NAUSICAA_DEFINE_VALUE([CURLOPT_HEADER])
NAUSICAA_DEFINE_VALUE([CURLOPT_NOPROGRESS])
NAUSICAA_DEFINE_VALUE([CURLOPT_NOBODY])
NAUSICAA_DEFINE_VALUE([CURLOPT_FAILONERROR])
NAUSICAA_DEFINE_VALUE([CURLOPT_UPLOAD])
NAUSICAA_DEFINE_VALUE([CURLOPT_POST])
NAUSICAA_DEFINE_VALUE([CURLOPT_DIRLISTONLY])
NAUSICAA_DEFINE_VALUE([CURLOPT_APPEND])
NAUSICAA_DEFINE_VALUE([CURLOPT_NETRC])
NAUSICAA_DEFINE_VALUE([CURLOPT_FOLLOWLOCATION])
NAUSICAA_DEFINE_VALUE([CURLOPT_TRANSFERTEXT])
NAUSICAA_DEFINE_VALUE([CURLOPT_PUT])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROGRESSFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROGRESSDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_AUTOREFERER])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROXYPORT])
NAUSICAA_DEFINE_VALUE([CURLOPT_POSTFIELDSIZE])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTPPROXYTUNNEL])
NAUSICAA_DEFINE_VALUE([CURLOPT_INTERFACE])
NAUSICAA_DEFINE_VALUE([CURLOPT_KRBLEVEL])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSL_VERIFYPEER])
NAUSICAA_DEFINE_VALUE([CURLOPT_CAINFO])
NAUSICAA_DEFINE_VALUE([CURLOPT_MAXREDIRS])
NAUSICAA_DEFINE_VALUE([CURLOPT_FILETIME])
NAUSICAA_DEFINE_VALUE([CURLOPT_TELNETOPTIONS])
NAUSICAA_DEFINE_VALUE([CURLOPT_MAXCONNECTS])
NAUSICAA_DEFINE_VALUE([CURLOPT_CLOSEPOLICY])
NAUSICAA_DEFINE_VALUE([CURLOPT_FRESH_CONNECT])
NAUSICAA_DEFINE_VALUE([CURLOPT_FORBID_REUSE])
NAUSICAA_DEFINE_VALUE([CURLOPT_RANDOM_FILE])
NAUSICAA_DEFINE_VALUE([CURLOPT_EGDSOCKET])
NAUSICAA_DEFINE_VALUE([CURLOPT_CONNECTTIMEOUT])
NAUSICAA_DEFINE_VALUE([CURLOPT_HEADERFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTPGET])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSL_VERIFYHOST])
NAUSICAA_DEFINE_VALUE([CURLOPT_COOKIEJAR])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSL_CIPHER_LIST])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTP_VERSION])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_USE_EPSV])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSLCERTTYPE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSLKEY])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSLKEYTYPE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSLENGINE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSLENGINE_DEFAULT])
NAUSICAA_DEFINE_VALUE([CURLOPT_DNS_USE_GLOBAL_CACHE])
NAUSICAA_DEFINE_VALUE([CURLOPT_DNS_CACHE_TIMEOUT])
NAUSICAA_DEFINE_VALUE([CURLOPT_PREQUOTE])
NAUSICAA_DEFINE_VALUE([CURLOPT_DEBUGFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_DEBUGDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_COOKIESESSION])
NAUSICAA_DEFINE_VALUE([CURLOPT_CAPATH])
NAUSICAA_DEFINE_VALUE([CURLOPT_BUFFERSIZE])
NAUSICAA_DEFINE_VALUE([CURLOPT_NOSIGNAL])
NAUSICAA_DEFINE_VALUE([CURLOPT_SHARE])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROXYTYPE])
NAUSICAA_DEFINE_VALUE([CURLOPT_ENCODING])
NAUSICAA_DEFINE_VALUE([CURLOPT_PRIVATE])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTP200ALIASES])
NAUSICAA_DEFINE_VALUE([CURLOPT_UNRESTRICTED_AUTH])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_USE_EPRT])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTPAUTH])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSL_CTX_FUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSL_CTX_DATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_CREATE_MISSING_DIRS])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROXYAUTH])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_RESPONSE_TIMEOUT])
NAUSICAA_DEFINE_VALUE([CURLOPT_IPRESOLVE])
NAUSICAA_DEFINE_VALUE([CURLOPT_MAXFILESIZE])
NAUSICAA_DEFINE_VALUE([CURLOPT_INFILESIZE_LARGE])
NAUSICAA_DEFINE_VALUE([CURLOPT_RESUME_FROM_LARGE])
NAUSICAA_DEFINE_VALUE([CURLOPT_MAXFILESIZE_LARGE])
NAUSICAA_DEFINE_VALUE([CURLOPT_NETRC_FILE])
NAUSICAA_DEFINE_VALUE([CURLOPT_USE_SSL])
NAUSICAA_DEFINE_VALUE([CURLOPT_POSTFIELDSIZE_LARGE])
NAUSICAA_DEFINE_VALUE([CURLOPT_TCP_NODELAY])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTPSSLAUTH])
NAUSICAA_DEFINE_VALUE([CURLOPT_IOCTLFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_IOCTLDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_ACCOUNT])
NAUSICAA_DEFINE_VALUE([CURLOPT_COOKIELIST])
NAUSICAA_DEFINE_VALUE([CURLOPT_IGNORE_CONTENT_LENGTH])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_SKIP_PASV_IP])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_FILEMETHOD])
NAUSICAA_DEFINE_VALUE([CURLOPT_LOCALPORT])
NAUSICAA_DEFINE_VALUE([CURLOPT_LOCALPORTRANGE])
NAUSICAA_DEFINE_VALUE([CURLOPT_CONNECT_ONLY])
NAUSICAA_DEFINE_VALUE([CURLOPT_CONV_FROM_NETWORK_FUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_CONV_TO_NETWORK_FUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_CONV_FROM_UTF8_FUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_MAX_SEND_SPEED_LARGE])
NAUSICAA_DEFINE_VALUE([CURLOPT_MAX_RECV_SPEED_LARGE])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_ALTERNATIVE_TO_USER])
NAUSICAA_DEFINE_VALUE([CURLOPT_SOCKOPTFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_SOCKOPTDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSL_SESSIONID_CACHE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSH_AUTH_TYPES])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSH_PUBLIC_KEYFILE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSH_PRIVATE_KEYFILE])
NAUSICAA_DEFINE_VALUE([CURLOPT_FTP_SSL_CCC])
NAUSICAA_DEFINE_VALUE([CURLOPT_TIMEOUT_MS])
NAUSICAA_DEFINE_VALUE([CURLOPT_CONNECTTIMEOUT_MS])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTP_TRANSFER_DECODING])
NAUSICAA_DEFINE_VALUE([CURLOPT_HTTP_CONTENT_DECODING])
NAUSICAA_DEFINE_VALUE([CURLOPT_NEW_FILE_PERMS])
NAUSICAA_DEFINE_VALUE([CURLOPT_NEW_DIRECTORY_PERMS])
NAUSICAA_DEFINE_VALUE([CURLOPT_POSTREDIR])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSH_HOST_PUBLIC_KEY_MD5])
NAUSICAA_DEFINE_VALUE([CURLOPT_OPENSOCKETFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_OPENSOCKETDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_COPYPOSTFIELDS])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROXY_TRANSFER_MODE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SEEKFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_SEEKDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_CRLFILE])
NAUSICAA_DEFINE_VALUE([CURLOPT_ISSUERCERT])
NAUSICAA_DEFINE_VALUE([CURLOPT_ADDRESS_SCOPE])
NAUSICAA_DEFINE_VALUE([CURLOPT_CERTINFO])
NAUSICAA_DEFINE_VALUE([CURLOPT_USERNAME])
NAUSICAA_DEFINE_VALUE([CURLOPT_PASSWORD])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROXYUSERNAME])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROXYPASSWORD])
NAUSICAA_DEFINE_VALUE([CURLOPT_NOPROXY])
NAUSICAA_DEFINE_VALUE([CURLOPT_TFTP_BLKSIZE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SOCKS5_GSSAPI_SERVICE])
NAUSICAA_DEFINE_VALUE([CURLOPT_SOCKS5_GSSAPI_NEC])
NAUSICAA_DEFINE_VALUE([CURLOPT_PROTOCOLS])
NAUSICAA_DEFINE_VALUE([CURLOPT_REDIR_PROTOCOLS])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSH_KNOWNHOSTS])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSH_KEYFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLOPT_SSH_KEYDATA])
NAUSICAA_DEFINE_VALUE([CURLOPT_LASTENTRY])

dnl Preprocessor symbols: enum CURL_NETRC_OPTION
NAUSICAA_DEFINE_VALUE([CURL_NETRC_IGNORED])
NAUSICAA_DEFINE_VALUE([CURL_NETRC_OPTIONAL])
NAUSICAA_DEFINE_VALUE([CURL_NETRC_REQUIRED])
NAUSICAA_DEFINE_VALUE([CURL_NETRC_LAST])

dnl Preprocessor symbols: enum curl_TimeCond
NAUSICAA_DEFINE_VALUE([CURL_TIMECOND_NONE])
NAUSICAA_DEFINE_VALUE([CURL_TIMECOND_IFMODSINCE])
NAUSICAA_DEFINE_VALUE([CURL_TIMECOND_IFUNMODSINCE])
NAUSICAA_DEFINE_VALUE([CURL_TIMECOND_LASTMOD])
NAUSICAA_DEFINE_VALUE([CURL_TIMECOND_LAST])

dnl Preprocessor symbols: enum CURLformoption
NAUSICAA_DEFINE_VALUE([CURLFORM_NOTHING])
NAUSICAA_DEFINE_VALUE([CURLFORM_COPYNAME])
NAUSICAA_DEFINE_VALUE([CURLFORM_PTRNAME])
NAUSICAA_DEFINE_VALUE([CURLFORM_NAMELENGTH])
NAUSICAA_DEFINE_VALUE([CURLFORM_COPYCONTENTS])
NAUSICAA_DEFINE_VALUE([CURLFORM_PTRCONTENTS])
NAUSICAA_DEFINE_VALUE([CURLFORM_CONTENTSLENGTH])
NAUSICAA_DEFINE_VALUE([CURLFORM_FILECONTENT])
NAUSICAA_DEFINE_VALUE([CURLFORM_ARRAY])
NAUSICAA_DEFINE_VALUE([CURLFORM_OBSOLETE])
NAUSICAA_DEFINE_VALUE([CURLFORM_FILE])
NAUSICAA_DEFINE_VALUE([CURLFORM_BUFFER])
NAUSICAA_DEFINE_VALUE([CURLFORM_BUFFERPTR])
NAUSICAA_DEFINE_VALUE([CURLFORM_BUFFERLENGTH])
NAUSICAA_DEFINE_VALUE([CURLFORM_CONTENTTYPE])
NAUSICAA_DEFINE_VALUE([CURLFORM_CONTENTHEADER])
NAUSICAA_DEFINE_VALUE([CURLFORM_FILENAME])
NAUSICAA_DEFINE_VALUE([CURLFORM_END])
NAUSICAA_DEFINE_VALUE([CURLFORM_OBSOLETE2])
NAUSICAA_DEFINE_VALUE([CURLFORM_STREAM])
NAUSICAA_DEFINE_VALUE([CURLFORM_LASTENTRY])

dnl Preprocessor symbols: enum CURLFORMcode
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_OK])
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_MEMORY])
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_OPTION_TWICE])
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_NULL])
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_UNKNOWN_OPTION])
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_INCOMPLETE])
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_ILLEGAL_ARRAY])
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_DISABLED])
NAUSICAA_DEFINE_VALUE([CURL_FORMADD_LAST])

dnl Preprocessor symbols: ?
NAUSICAA_DEFINE_VALUE([CURLINFO_STRING])
NAUSICAA_DEFINE_VALUE([CURLINFO_LONG])
NAUSICAA_DEFINE_VALUE([CURLINFO_DOUBLE])
NAUSICAA_DEFINE_VALUE([CURLINFO_SLIST])
NAUSICAA_DEFINE_VALUE([CURLINFO_MASK])
NAUSICAA_DEFINE_VALUE([CURLINFO_TYPEMASK])

dnl Preprocessor symbols: enum CURLINFO
NAUSICAA_DEFINE_VALUE([CURLINFO_NONE])
NAUSICAA_DEFINE_VALUE([CURLINFO_EFFECTIVE_URL])
NAUSICAA_DEFINE_VALUE([CURLINFO_RESPONSE_CODE])
NAUSICAA_DEFINE_VALUE([CURLINFO_TOTAL_TIME])
NAUSICAA_DEFINE_VALUE([CURLINFO_NAMELOOKUP_TIME])
NAUSICAA_DEFINE_VALUE([CURLINFO_CONNECT_TIME])
NAUSICAA_DEFINE_VALUE([CURLINFO_PRETRANSFER_TIME])
NAUSICAA_DEFINE_VALUE([CURLINFO_SIZE_UPLOAD])
NAUSICAA_DEFINE_VALUE([CURLINFO_SIZE_DOWNLOAD])
NAUSICAA_DEFINE_VALUE([CURLINFO_SPEED_DOWNLOAD])
NAUSICAA_DEFINE_VALUE([CURLINFO_SPEED_UPLOAD])
NAUSICAA_DEFINE_VALUE([CURLINFO_HEADER_SIZE])
NAUSICAA_DEFINE_VALUE([CURLINFO_REQUEST_SIZE])
NAUSICAA_DEFINE_VALUE([CURLINFO_SSL_VERIFYRESULT])
NAUSICAA_DEFINE_VALUE([CURLINFO_FILETIME])
NAUSICAA_DEFINE_VALUE([CURLINFO_CONTENT_LENGTH_DOWNLOAD])
NAUSICAA_DEFINE_VALUE([CURLINFO_CONTENT_LENGTH_UPLOAD])
NAUSICAA_DEFINE_VALUE([CURLINFO_STARTTRANSFER_TIME])
NAUSICAA_DEFINE_VALUE([CURLINFO_CONTENT_TYPE])
NAUSICAA_DEFINE_VALUE([CURLINFO_REDIRECT_TIME])
NAUSICAA_DEFINE_VALUE([CURLINFO_REDIRECT_COUNT])
NAUSICAA_DEFINE_VALUE([CURLINFO_PRIVATE])
NAUSICAA_DEFINE_VALUE([CURLINFO_HTTP_CONNECTCODE])
NAUSICAA_DEFINE_VALUE([CURLINFO_HTTPAUTH_AVAIL])
NAUSICAA_DEFINE_VALUE([CURLINFO_PROXYAUTH_AVAIL])
NAUSICAA_DEFINE_VALUE([CURLINFO_OS_ERRNO])
NAUSICAA_DEFINE_VALUE([CURLINFO_NUM_CONNECTS])
NAUSICAA_DEFINE_VALUE([CURLINFO_SSL_ENGINES])
NAUSICAA_DEFINE_VALUE([CURLINFO_COOKIELIST])
NAUSICAA_DEFINE_VALUE([CURLINFO_LASTSOCKET])
NAUSICAA_DEFINE_VALUE([CURLINFO_FTP_ENTRY_PATH])
NAUSICAA_DEFINE_VALUE([CURLINFO_REDIRECT_URL])
NAUSICAA_DEFINE_VALUE([CURLINFO_PRIMARY_IP])
NAUSICAA_DEFINE_VALUE([CURLINFO_APPCONNECT_TIME])
NAUSICAA_DEFINE_VALUE([CURLINFO_CERTINFO])
NAUSICAA_DEFINE_VALUE([CURLINFO_CONDITION_UNMET])
NAUSICAA_DEFINE_VALUE([CURLINFO_LASTONE])
NAUSICAA_DEFINE_VALUE([CURLINFO_HTTP_CODE])

dnl Preprocessor symbols: enum curl_closepolicy
NAUSICAA_DEFINE_VALUE([CURLCLOSEPOLICY_NONE])
NAUSICAA_DEFINE_VALUE([CURLCLOSEPOLICY_OLDEST])
NAUSICAA_DEFINE_VALUE([CURLCLOSEPOLICY_LEAST_RECENTLY_USED])
NAUSICAA_DEFINE_VALUE([CURLCLOSEPOLICY_LEAST_TRAFFIC])
NAUSICAA_DEFINE_VALUE([CURLCLOSEPOLICY_SLOWEST])
NAUSICAA_DEFINE_VALUE([CURLCLOSEPOLICY_CALLBACK])
NAUSICAA_DEFINE_VALUE([CURLCLOSEPOLICY_LAST])

dnl Preprocessor symbols: enum curl_lock_data
NAUSICAA_DEFINE_VALUE([CURL_LOCK_DATA_NONE])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_DATA_SHARE])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_DATA_COOKIE])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_DATA_DNS])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_DATA_SSL_SESSION])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_DATA_CONNECT])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_DATA_LAST])

dnl Preprocessor symbols: enum curl_lock_access
NAUSICAA_DEFINE_VALUE([CURL_LOCK_ACCESS_NONE])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_ACCESS_SHARED])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_ACCESS_SINGLE])
NAUSICAA_DEFINE_VALUE([CURL_LOCK_ACCESS_LAST])

dnl Preprocessor symbols: enum CURLSHcode
NAUSICAA_DEFINE_VALUE([CURLSHE_OK])
NAUSICAA_DEFINE_VALUE([CURLSHE_BAD_OPTION])
NAUSICAA_DEFINE_VALUE([CURLSHE_IN_USE])
NAUSICAA_DEFINE_VALUE([CURLSHE_INVALID])
NAUSICAA_DEFINE_VALUE([CURLSHE_NOMEM])
NAUSICAA_DEFINE_VALUE([CURLSHE_LAST])

dnl Preprocessor symbols: enum CURLSHoption
NAUSICAA_DEFINE_VALUE([CURLSHOPT_NONE])
NAUSICAA_DEFINE_VALUE([CURLSHOPT_SHARE])
NAUSICAA_DEFINE_VALUE([CURLSHOPT_UNSHARE])
NAUSICAA_DEFINE_VALUE([CURLSHOPT_LOCKFUNC])
NAUSICAA_DEFINE_VALUE([CURLSHOPT_UNLOCKFUNC])
NAUSICAA_DEFINE_VALUE([CURLSHOPT_USERDATA])
NAUSICAA_DEFINE_VALUE([CURLSHOPT_LAST])

dnl Preprocessor symbols: enum CURLversion
NAUSICAA_DEFINE_VALUE([CURLVERSION_FIRST])
NAUSICAA_DEFINE_VALUE([CURLVERSION_SECOND])
NAUSICAA_DEFINE_VALUE([CURLVERSION_THIRD])
NAUSICAA_DEFINE_VALUE([CURLVERSION_FOURTH])
NAUSICAA_DEFINE_VALUE([CURLVERSION_LAST])
NAUSICAA_DEFINE_VALUE([CURLVERSION_NOW])

dnl Preprocessor symbols: version codes
NAUSICAA_DEFINE_VALUE([CURL_VERSION_IPV6])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_KERBEROS4])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_SSL])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_LIBZ])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_NTLM])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_GSSNEGOTIATE])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_DEBUG])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_ASYNCHDNS])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_SPNEGO])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_LARGEFILE])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_IDN])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_SSPI])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_CONV])
NAUSICAA_DEFINE_VALUE([CURL_VERSION_CURLDEBUG])

dnl Preprocessor symbols: enum CURLMcode
NAUSICAA_DEFINE_VALUE([CURLM_CALL_MULTI_PERFORM])
NAUSICAA_DEFINE_VALUE([CURLM_OK])
NAUSICAA_DEFINE_VALUE([CURLM_BAD_HANDLE])
NAUSICAA_DEFINE_VALUE([CURLM_BAD_EASY_HANDLE])
NAUSICAA_DEFINE_VALUE([CURLM_OUT_OF_MEMORY])
NAUSICAA_DEFINE_VALUE([CURLM_INTERNAL_ERROR])
NAUSICAA_DEFINE_VALUE([CURLM_BAD_SOCKET])
NAUSICAA_DEFINE_VALUE([CURLM_UNKNOWN_OPTION])
NAUSICAA_DEFINE_VALUE([CURLM_LAST])

dnl Preprocessor symbols: enum CURLMSG
NAUSICAA_DEFINE_VALUE([CURLMSG_NONE])
NAUSICAA_DEFINE_VALUE([CURLMSG_DONE])
NAUSICAA_DEFINE_VALUE([CURLMSG_LAST])

dnl Preprocessor symbols: enum CURLMoption
NAUSICAA_DEFINE_VALUE([CURLMOPT_SOCKETFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLMOPT_SOCKETDATA])
NAUSICAA_DEFINE_VALUE([CURLMOPT_PIPELINING])
NAUSICAA_DEFINE_VALUE([CURLMOPT_TIMERFUNCTION])
NAUSICAA_DEFINE_VALUE([CURLMOPT_TIMERDATA])
NAUSICAA_DEFINE_VALUE([CURLMOPT_MAXCONNECTS])
NAUSICAA_DEFINE_VALUE([CURLMOPT_LASTENTRY])

dnl end of file
