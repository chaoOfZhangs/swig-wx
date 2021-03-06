/* -----------------------------------------------------------------------------
 * See the LICENSE file for information on copyright, usage and redistribution
 * of SWIG, and the README file for authors - http://www.swig.org/release.html.
 *
 * Typemaps used by the STL wrappers that throw exceptions.
 * These typemaps are used when methods are declared with an STL exception
 * specification, such as:
 *   size_t at() const throw (std::out_of_range);
 *
 * std_except.i
 * ----------------------------------------------------------------------------- */

%{
#include <stdexcept>
%}
%include <exception.i>

%typemap(throws) std::out_of_range %{
SWIG_exception(SWIG_IndexError, $1.what()); %}

%typemap(throws) std::exception %{
SWIG_exception(SWIG_SystemError, $1.what()); %}

%typemap(throws) std::exception& %{
SWIG_exception(SWIG_SystemError, ($1)->what()); %}
