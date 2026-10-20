from setuptools import setup, find_packages

setup(
    name='apiverve_menstrualcyclecalculator',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Menstrual Cycle Calculator is a period tracker API that predicts future menstrual cycles, fertile windows, and ovulation dates from the last period date and the average cycle and period length.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/menstrualcycle?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
