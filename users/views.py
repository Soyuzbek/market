from django.contrib.auth import login
from django.shortcuts import render, redirect
from django.views import View

from users.forms import UserSignUpForm
from users.models import User


class SignUpView(View):
    model = User
    form_class = UserSignUpForm
    template_name = 'signup_form.html'

    def get(self, request, **kwargs):
        form = self.form_class()
        return render(request, self.template_name, locals())

    def post(self, request):
        form = self.form_class(request.POST)
        print('validation of form: ', form.is_valid(), '\n', 'form : ', form)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return render(request, 'index.html', {})
        return render(request, self.template_name, {'errors': form.error_messages})


class LanguageView(View):

    def get(self, request, lang):
        request.session['_language'] = lang
        return redirect(request.META.get('HTTP_REFERER', '/'))
